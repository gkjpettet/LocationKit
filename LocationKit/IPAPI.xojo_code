#tag Module
Protected Module IPAPI
	#tag Method, Flags = &h1
		Protected Sub Get(callback As LocationKit.LocationObtained)
		  ' Get the geolocation from this computer's IP.
		  
		  ' Setup our socket.
		  mSocket = New LocationKit.IPAPI.IPAPISocket(callback)
		  
		  ' Make the request.
		  If LocationKit.APIKey <> "" Then
		    mSocket.Send("GET", kURL + "/json/?key=" + LocationKit.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/json/")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Get(ip As Text, callback As LocationKit.LocationObtained)
		  ' Get the geolocation of a specific IP.
		  
		  ' Check the passed IP address is a valid IPV4 address.
		  If Not LocationKit.ValidIP(ip) Then Return
		  
		  ' Setup our socket.
		  mSocket = New LocationKit.IPAPI.IPAPISocket(callback)
		  
		  ' Make the request.
		  If LocationKit.APIKey <> "" Then
		    mSocket.Send("GET", kURL + "/" + ip + "/json/?key=" + LocationKit.APIKey)
		  Else
		    mSocket.Send("GET", kURL + "/" + ip + "/json/")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function JSONDictToLocation(d As Xojo.Core.Dictionary) As LocationKit.Geolocation
		  ' Takes a Dictionary that has been derived from the JSON returned by the ipapi.co API 
		  ' and returns it as a Geolocation.
		  
		  #Pragma BreakOnExceptions False
		  
		  Dim geo As New LocationKit.Geolocation
		  
		  Try
		    geo.IP = d.Value("ip")
		  Catch
		    geo.IP = ""
		  End Try
		  
		  Try
		    geo.City = d.Value("city")
		  Catch
		    geo.City = ""
		  End Try
		  
		  Try
		    geo.Region = d.Value("region")
		  Catch
		    geo.Region = ""
		  End Try
		  
		  Try
		    geo.RegionCode = d.Value("region_code")
		  Catch
		    geo.RegionCode = ""
		  End Try
		  
		  Try
		    geo.Country = d.Value("country")
		  Catch
		    geo.Country = ""
		  End Try
		  
		  Try
		    geo.CountryName = d.Value("country_name")
		  Catch
		    geo.CountryName = ""
		  End Try
		  
		  Try
		    geo.ContinentCode = d.Value("continent_code")
		  Catch
		    geo.ContinentCode = ""
		  End Try
		  
		  Try
		    geo.InEU = d.Value("in_eu")
		  Catch
		    geo.InEU = True
		  End Try
		  
		  Try
		    geo.Postal = d.Value("postal")
		  Catch
		    geo.Postal = ""
		  End Try
		  
		  Try
		    geo.Latitude = d.Value("latitude")
		  Catch
		    geo.Latitude = 0
		  End Try
		  
		  Try
		    geo.Longitude = d.Value("longitude")
		  Catch
		    geo.Longitude = 0
		  End Try
		  
		  Try
		    Dim tz AS Text = d.value("timezone")
		    geo.TimeZone = New Xojo.Core.TimeZone(tz)
		  Catch
		    geo.TimeZone = Nil
		  End Try
		  
		  Try
		    geo.UTCOffset = d.Value("utc_offset")
		  Catch
		    geo.UTCOffset = ""
		  End Try
		  
		  Try
		    geo.CountryCallingCode = d.Value("country_calling_code")
		  Catch
		    geo.CountryCallingCode = ""
		  End Try
		  
		  Try
		    geo.CurrencyCode = d.Value("currency")
		  Catch
		    geo.CurrencyCode = ""
		  End Try
		  
		  Return geo
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSocket As LocationKit.IPAPI.IPAPISocket
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
