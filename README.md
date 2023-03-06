# CityView
Show a list of cities with distance and map view in SwiftUI

# Goal
Build an app with the following 2 views:
- [x] My distance from cities view
- [x] City boundaries view

My distance from cities view
This view must list all the cities returned from the endpoint 
and also display how far the user is from the cities’ coordinates.

Selecting a city navigates the app to the “City boundaries view”.

City boundaries view
This view displays a map that draws a polygon around the city boundary.
The boundary of a city is returned in the “points” parameter as a list of
coordinates. Use these coordinates to display the boundary on the map.



# Result

<table>
 <tr>
    <td>Default distance</td>
    <td>Calculated distance</td>
    <td>Detail map view</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/6905564/223020326-c55f0eea-7c16-4872-baa9-835272768394.PNG" width="250" height="447" alt="Default"></td>
    <td><img src="https://user-images.githubusercontent.com/6905564/223020334-28d4c86d-5abd-4916-9fbc-90b10269a6e6.PNG" width="250" height="447" alt="Distance"></td>
    <td><img src="https://user-images.githubusercontent.com/6905564/223020337-fb0e7f18-87c7-425f-8487-b50a4d97439c.PNG" width="250" height="447" alt="Map"></td>
  </tr>
</table>

# Note
1. App shows the default distance from cities when calulcated from location 0.0.
2. App will update the distance once the current location is fetched and displayed, if not updated, scroll in the list to see the distance updated as the screenshots showed for Amsterdam.
3. City boundaries view is NOT completed, I am not sure how to proceed with the drawing part, would love to learn more about this area.
4. Cities are sorted alphabetically, would be interesting to sort them by distance from current location.
5. When no network, app should be displaying an alert to tell user, currently it is an empty view.
