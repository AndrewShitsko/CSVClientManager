package csvclientmanager

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClientController {

    def googleMapService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model: [clientCount: Client.count()]
    }

    def imports() {
        render(view: "import")
    }

    def importFile() {
        def importedCount = 0
        def firstLine = true
        params.file.inputStream.splitEachLine(",") { fields ->
            if (firstLine) {
                firstLine = false
                return
            }
            def loc = googleMapService.getLatLong(fields[2])
            def client = new Client(name: fields[0].trim(),
                    email: fields[1].trim(),
                    street: fields[2].trim(),
                    zip: fields[3].trim(),
                    latitude: loc.lat,
                    longitude: loc.lng)

                if (client.save(flush: true))
                importedCount++
        }
        def response = ["importedCount": importedCount]
        render response as JSON
    }

    def search(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def word = params.q
        if (!word) return
        def clients = Client.withCriteria {
            or {
                like("name", "%${word}%")
                like("email", "%${word}%")
                like("street", "%${word}%")
                like("zip", "%${word}%")
            }
        }
        respond clients, model: [clients: clients, clientCount: clients ? clients.size() : 0]
    }

    def map() {
        respond Client.list()
    }

    def show(Client client) {
        respond client
    }

    def create() {
        respond new Client(params)
    }

    def edit(Client client) {
        respond client
    }

    @Transactional
    def update(Client client) {
        if (client == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (client.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond client.errors, view: 'edit'
            return
        }

        def loc = googleMapService.getLatLong(client.street)
        client.latitude = loc.lat
        client.longitude = loc.lng

        client.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), client.id])
                redirect client
            }
            '*' { respond client, [status: OK] }
        }
    }

    @Transactional
    def delete(Client client) {

        if (client == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        client.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), client.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
