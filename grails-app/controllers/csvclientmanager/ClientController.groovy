package csvclientmanager

class ClientController {

    def index() {
        respond new Client(params)
    }
}
