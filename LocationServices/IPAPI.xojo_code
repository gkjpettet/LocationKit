#tag Module
Protected Module IPAPI
	#tag Method, Flags = &h1
		Protected Sub Get(callback As LocationServices.LocationObtained)
		  ' Get the geolocation from this computer's IP.
		  
		  ' Setup our socket.
		  mSocket = New LocationServices.IPAPI.IPAPISocket(callback)
		  
		  ' Make the request.
		  If LocationServices.APIKey <> "" Then
		    mSocket.Send("GET", kURL + "/json/?key=" + LocationServices.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/json/")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Get(ip As Text, callback As LocationServices.LocationObtained)
		  ' Get the geolocation of a specific IP.
		  
		  ' Check the passed IP address is a valid IPV4 address.
		  If Not LocationServices.ValidIP(ip) Then Return
		  
		  ' Setup our socket.
		  mSocket = New LocationServices.IPAPI.IPAPISocket(callback)
		  
		  ' Make the request.
		  If LocationServices.APIKey <> "" Then
		    mSocket.Send("GET", kURL + "/" + ip + "/json/?key=" + LocationServices.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/" + ip + "/json/")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function JSONDictToLocation(d As Xojo.Core.Dictionary) As LocationServices.Geolocation
		  ' Takes a Dictionary that has been derived from the JSON returned by the ipapi.co API 
		  ' and returns it as a Geolocation.
		  
		  Dim geo As New LocationServices.Geolocation
		  
		  geo.IP = d.Lookup("ip", "")
		  geo.City = d.Lookup("city", "")
		  geo.Region = d.Lookup("region", "")
		  geo.RegionCode = d.Lookup("region_code", "")
		  geo.Country = d.Lookup("country", "")
		  geo.CountryName = d.Lookup("country_name", "")
		  geo.ContinentCode = d.Lookup("continent_code", "")
		  geo.InEU = d.Lookup("in_eu", True)
		  geo.Postal = d.Lookup("postal", "")
		  geo.Latitude = d.Lookup("latitude", "")
		  geo.Longitude = d.Lookup("longitude", "")
		  Try
		    Dim tz AS Text = d.Lookup("timezone", "")
		    geo.TimeZone = New Xojo.Core.TimeZone(tz)
		  Catch
		    geo.TimeZone = Nil
		  End Try
		  geo.UTCOffset = d.Lookup("utc_offset", "")
		  geo.CountryCallingCode = d.Lookup("country_calling_code", "")
		  geo.CurrencyCode = d.Lookup("currency", "")
		  
		  Return geo
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSocket As LocationServices.IPAPI.IPAPISocket
	#tag EndProperty


	#tag Constant, Name = kTimeout, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURL, Type = Text, Dynamic = False, Default = \"https://ipapi.co", Scope = Private
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
