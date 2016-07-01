package csvclientmanager

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class GoogleMapService {

    public static final String GOOGLE_MAP_URL = "http://maps.googleapis.com/maps/api/geocode/json?address="

    def getLatLong(String address) {
        def result = null
        URL url = new URL(GOOGLE_MAP_URL + URLEncoder.encode(address, "UTF-8"))
        def json = new JsonSlurper().parse(url)
        if (json.results && json.results.size() > 0) {
            def jsonResult = json.results[0]
            if (jsonResult.geometry && jsonResult.geometry.location) {
                def lat = jsonResult.geometry.location.lat
                def lng = jsonResult.geometry.location.lng
                result = [lat: lat.toDouble(), lng: lng.toDouble()]
            }
        }
        return result
    }
}
