#tag Module
Protected Module IP_API
	#tag Method, Flags = &h1
		Protected Sub Get(callback As LocationServices.LocationObtained)
		  ' Setup our socket.
		  mSocket = New LocationServices.IP_API.IP_APISocket(callback)
		  
		  ' Make the request.
		  If LocationServices.APIKey <> "" Then
		    mSocket.Send("GET", kURLWithAPIKey + "/?key=" + LocationServices.APIKey)
		  Else
		    mSocket.Send("GET", kURL)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Get(ip As Text, callback As LocationServices.LocationObtained)
		  ' Check the passed IP address is a valid IPV4 address.
		  If Not LocationServices.ValidIP(ip) Then Return
		  
		  ' Setup our socket.
		  mSocket = New LocationServices.IP_API.IP_APISocket(callback)
		  
		  ' Make the request.
		  If LocationServices.APIKey <> "" Then
		    mSocket.Send("GET", kURLWithAPIKey + "/" + ip + "?key=" + LocationServices.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/" + ip)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function JSONDictToLocation(d As Xojo.Core.Dictionary) As LocationServices.Geolocation
		  ' Takes a Dictionary that has been derived from the JSON returned by the ip-api.com API
		  ' and returns it as a Geolocation.
		  
		  Dim geo As New LocationServices.Geolocation
		  
		  geo.Country = d.Lookup("country", "")
		  geo.CountryCode = d.Lookup("countryCode", "")
		  geo.Region = d.Lookup("region", "")
		  geo.RegionName = d.Lookup("regionName", "")
		  geo.City = d.Lookup("city", "")
		  geo.Postal = d.Lookup("zip", "")
		  geo.Latitude = d.Lookup("lat", "")
		  geo.Longitude = d.Lookup("lon", "")
		  Try
		    Dim tz As Text = d.Lookup("timezone", "")
		    geo.TimeZone = New Xojo.Core.TimeZone(tz)
		  Catch
		    geo.TimeZone = Nil
		  End Try
		  
		  Return geo
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSocket As LocationServices.IP_API.IP_APISocket
	#tag EndProperty


	#tag Constant, Name = kTimeout, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURL, Type = Text, Dynamic = False, Default = \"http://ip-api.com/json", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURLWithAPIKey, Type = Text, Dynamic = False, Default = \"https://pro.ip-api.com/json", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
