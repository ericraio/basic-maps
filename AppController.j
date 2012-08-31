@import <Foundation/CPObject.j>
@import <MapKit/MKMapView.j>
@import <MapKit/MKMarker.j>
@import <MapKit/MKLocation.j>

@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPView customView;
    @outlet CPTextField nameTextField;
    MKMapView mapView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    mapView = [[MKMapView alloc] initWithFrame:[customView frame] "];
    [mapView setFrameOrigin:CGPointMake(0.0, 0.0)];
    [mapView setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
    [customView addSubview:mapView];
}

- (@action)setLocation:(id)sender
{
    var gm = [MKMapView gmNameSpace];
    var geocoder = new gm.ClientGeoCoder();
    var address = [sender stringValue];
    
    geocoder.getLatLng(
        address,
        function(point) {
            if (!point) {
                alert(address + " could not be found.");
            } else {
                [self moveMapToLocation:point];
            }
    });
}

@end