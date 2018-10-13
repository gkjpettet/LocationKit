#tag Module
Protected Module IPStack
	#tag Method, Flags = &h1
		Protected Sub Get(callback As LocationKit.LocationObtained)
		  ' Get the geolocation from this computer's IP.
		  
		  ' Setup our socket.
		  mSocket = New LocationKit.IPStack.IPStackSocket(callback)
		  
		  ' Ensure an API key has been set.
		  If LocationKit.APIKey = "" Then
		    Raise New LocationKit.Error("IPStack requires an API for every request.")
		  End If
		  
		  ' Make the request. The URL to use depends upon whether or not this is a Pro 
		  ' or free account.
		  If LocationKit.Pro Then
		    mSocket.Send("GET", kURLSecure + "/check?access_key=" + LocationKit.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/check?access_key=" + LocationKit.APIKey)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Get(ip As Text, callback As LocationKit.LocationObtained)
		  ' Get the geolocation of a specific IP.
		  
		  ' Check the passed IP address is a valid IPV4 address.
		  If Not LocationKit.ValidIP(ip) Then Return
		  
		  ' Setup our socket.
		  mSocket = New LocationKit.IPStack.IPStackSocket(callback)
		  
		  ' Ensure an API key has been set.
		  If LocationKit.APIKey = "" Then
		    Raise New LocationKit.Error("IPStack requires an API for every request.")
		  End If
		  
		  ' Make the request. The URL to use depends upon whether or not this is a Pro 
		  ' or free account.
		  If LocationKit.Pro Then
		    mSocket.Send("GET", kURLSecure + "/" + ip + "?access_key=" + LocationKit.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/" + ip + "?access_key=" + LocationKit.APIKey)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function JSONDictToLocation(d As Xojo.Core.Dictionary) As LocationKit.Geolocation
		  ' Takes a Dictionary that has been derived from the JSON returned by the ipstack.com API 
		  ' and returns it as a Geolocation.
		  
		  Dim geo As New LocationKit.Geolocation
		  
		  geo.IP = d.Lookup("ip", "")
		  geo.ContinentCode = d.Lookup("continent_code", "")
		  geo.ContinentName = d.Lookup("continent_name", "")
		  geo.CountryCode = d.Lookup("country_code", "")
		  geo.CountryName = d.Lookup("country_name", "")
		  geo.RegionCode = d.Lookup("region_code", "")
		  geo.RegionName = d.Lookup("region_name", "")
		  geo.City = d.Lookup("city", "")
		  geo.Postal = d.Lookup("zip", "")
		  geo.Latitude = d.Lookup("latitude", "")
		  geo.Longitude = d.Lookup("longitude", "")
		  geo.InEU = d.Lookup("is_eu", False)
		  
		  Try
		    Dim tzDict As Xojo.Core.Dictionary = d.Lookup("timezone", Nil)
		    If tzDict = Nil Then
		      geo.TimeZone = Nil
		    Else
		      Dim tz As Text = tzDict.Lookup("id", "")
		      geo.TimeZone = New Xojo.Core.TimeZone(tz)
		    End If
		  Catch
		    geo.TimeZone = Nil
		  End Try
		  
		  Try
		    Dim currencyDict As Xojo.Core.Dictionary = d.Lookup("currency", Nil)
		    If currencyDict = Nil Then
		      geo.CurrencyCode = ""
		    Else
		      geo.CurrencyCode = currencyDict.Lookup("code", "")
		    End If
		  Catch
		    geo.CurrencyCode = ""
		  End Try
		  
		  Return geo
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSocket As LocationKit.IPStack.IPStackSocket
	#tag EndProperty


	#tag Constant, Name = kTimeout, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURL, Type = Text, Dynamic = False, Default = \"http://api.ipstack.com", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURLSecure, Type = Text, Dynamic = False, Default = \"https://api.ipstack.com", Scope = Private
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
