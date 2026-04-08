import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    // Array to store up to 3 pins
    var pins: [MKPointAnnotation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // Center map on Ontario
        let ontario = CLLocationCoordinate2D(latitude: 51.2538, longitude: -85.3232)
        let region = MKCoordinateRegion(center: ontario,
                                        latitudinalMeters: 800000,
                                        longitudinalMeters: 800000)
        mapView.setRegion(region, animated: false)
        
        // Add tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapView.addGestureRecognizer(tap)
        
        // Add zoom in/out buttons
        setupZoomButtons()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Style Get Route button after layout is complete
        styleGetRouteButton()
    }

    // MARK: - Style Get Route Button
    func styleGetRouteButton() {
        for subview in view.subviews {
            if let button = subview as? UIButton, button.currentTitle == "Get Route" {
                button.backgroundColor = UIColor.systemRed
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                button.layer.cornerRadius = 14
                button.layer.shadowColor = UIColor.black.cgColor
                button.layer.shadowOffset = CGSize(width: 0, height: 3)
                button.layer.shadowOpacity = 0.4
                button.layer.shadowRadius = 5
                button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 28, bottom: 12, right: 28)
            }
        }
    }

    // MARK: - Zoom Buttons
    func setupZoomButtons() {
        // Zoom in button
        let zoomIn = UIButton(type: .system)
        zoomIn.setTitle("+", for: .normal)
        zoomIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        zoomIn.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        zoomIn.layer.cornerRadius = 8
        zoomIn.frame = CGRect(x: 16, y: 100, width: 44, height: 44)
        zoomIn.addTarget(self, action: #selector(zoomInTapped), for: .touchUpInside)
        mapView.addSubview(zoomIn)

        // Zoom out button
        let zoomOut = UIButton(type: .system)
        zoomOut.setTitle("-", for: .normal)
        zoomOut.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        zoomOut.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        zoomOut.layer.cornerRadius = 8
        zoomOut.frame = CGRect(x: 16, y: 152, width: 44, height: 44)
        zoomOut.addTarget(self, action: #selector(zoomOutTapped), for: .touchUpInside)
        mapView.addSubview(zoomOut)
    }

    // Zoom in by halving the span
    @objc func zoomInTapped() {
        var region = mapView.region
        region.span.latitudeDelta /= 2
        region.span.longitudeDelta /= 2
        mapView.setRegion(region, animated: true)
    }

    // Zoom out by doubling the span
    @objc func zoomOutTapped() {
        var region = mapView.region
        region.span.latitudeDelta = min(region.span.latitudeDelta * 2, 180)
        region.span.longitudeDelta = min(region.span.longitudeDelta * 2, 180)
        mapView.setRegion(region, animated: true)
    }

    // MARK: - Tap Handler
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: mapView)
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
        
        // Check if tapped near an existing pin — if so, remove it
        for pin in pins {
            let pinPoint = mapView.convert(pin.coordinate, toPointTo: mapView)
            let distance = hypot(point.x - pinPoint.x, point.y - pinPoint.y)
            if distance < 30 {
                pins.removeAll { $0 === pin }
                mapView.removeAnnotation(pin)
                updateOverlays()
                return
            }
        }
        
        // Add a new pin if fewer than 3 exist
        if pins.count < 3 {
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = ["A", "B", "C"][pins.count]
            pins.append(pin)
            mapView.addAnnotation(pin)
            
            // Draw triangle once all 3 pins are placed
            if pins.count == 3 {
                updateOverlays()
            }
        }
    }

    // MARK: - Draw Triangle
    func updateOverlays() {
        // Remove all existing overlays before redrawing
        mapView.removeOverlays(mapView.overlays)
        
        guard pins.count == 3 else { return }
        
        let coords = pins.map { $0.coordinate }
        
        // Green polylines for each side of the triangle
        for i in 0..<3 {
            let line = MKPolyline(coordinates: [coords[i], coords[(i+1)%3]], count: 2)
            mapView.addOverlay(line)
        }
        
        // Red filled polygon for triangle area (50% transparency)
        var triangle = coords
        let polygon = MKPolygon(coordinates: &triangle, count: 3)
        mapView.addOverlay(polygon)
        
        // Show distance labels on each side
        addDistanceAnnotations(coords: coords)
    }

    // MARK: - Distance Annotations
    func addDistanceAnnotations(coords: [CLLocationCoordinate2D]) {
        // Remove previously added distance annotations
        let distanceAnnotations = mapView.annotations.filter { $0.title??.starts(with: "📏") == true }
        mapView.removeAnnotations(distanceAnnotations)
        
        for i in 0..<3 {
            let a = coords[i]
            let b = coords[(i+1)%3]
            
            // Calculate straight-line distance in kilometers
            let locA = CLLocation(latitude: a.latitude, longitude: a.longitude)
            let locB = CLLocation(latitude: b.latitude, longitude: b.longitude)
            let distanceKm = locA.distance(from: locB) / 1000
            
            // Place annotation at midpoint of each side
            let midLat = (a.latitude + b.latitude) / 2
            let midLon = (a.longitude + b.longitude) / 2
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: midLat, longitude: midLon)
            annotation.title = String(format: "📏 %.1f km", distanceKm)
            mapView.addAnnotation(annotation)
        }
    }

    // MARK: - Overlay Renderer
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Render green polylines for triangle edges
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .green
            renderer.lineWidth = 3
            return renderer
        }
        // Render red semi-transparent fill for triangle area
        if let polygon = overlay as? MKPolygon {
            let renderer = MKPolygonRenderer(polygon: polygon)
            renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
            renderer.strokeColor = .clear
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }

    // MARK: - Get Route Button
    @IBAction func getRouteTapped(_ sender: Any) {
        // Ensure 3 pins are placed before requesting route
        guard pins.count == 3 else {
            let alert = UIAlertController(title: "Warning",
                                          message: "Please select 3 points on the map first.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        // Request driving route A → B → C → A
        getRoute(from: pins[0].coordinate, to: pins[1].coordinate) {
            self.getRoute(from: self.pins[1].coordinate, to: self.pins[2].coordinate) {
                self.getRoute(from: self.pins[2].coordinate, to: self.pins[0].coordinate, completion: nil)
            }
        }
    }

    // Requests a driving route between two coordinates and draws it on the map
    func getRoute(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, completion: (() -> Void)?) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: from))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: to))
        request.transportType = .automobile
        
        MKDirections(request: request).calculate { response, _ in
            if let route = response?.routes.first {
                DispatchQueue.main.async {
                    self.mapView.addOverlay(route.polyline)
                    completion?()
                }
            }
        }
    }
}
