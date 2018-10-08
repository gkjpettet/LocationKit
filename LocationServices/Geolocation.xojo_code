#tag Class
Protected Class Geolocation
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(geo As LocationServices.Geolocation)
		  ' Create a clone of the passed Geolocation object.
		  
		  Self.City = geo.City
		  Self.ContinentCode = geo.ContinentCode
		  Self.Country = geo.Country
		  Self.CountryCallingCode = geo.CountryCallingCode
		  Self.CountryCode = geo.CountryCode
		  Self.CountryName = geo.CountryName
		  Self.CurrencyCode = geo.CurrencyCode
		  Self.InEU = geo.InEU
		  Self.IP = geo.IP
		  Self.Latitude = geo.Latitude
		  Self.Longitude = geo.Longitude
		  Self.Postal = geo.Postal
		  Self.Region = geo.Region
		  Self.RegionCode = geo.RegionCode
		  Self.RegionName = geo.RegionName
		  Self.TimeZone = geo.TimeZone
		  Self.UTCOffset = geo.UTCOffset
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		City As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		ContinentCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		ContinentName As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Country As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		CountryCallingCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		CountryCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		CountryName As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrencyCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		InEU As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		IP As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Latitude As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Longitude As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Postal As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Region As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		RegionCode As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		RegionName As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeZone As Xojo.Core.TimeZone
	#tag EndProperty

	#tag Property, Flags = &h0
		UTCOffset As Text
	#tag EndProperty


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
		#tag ViewProperty
			Name="Country"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CountryCode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Region"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="City"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Postal"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Latitude"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Longitude"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IP"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CountryName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContinentCode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InEU"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UTCOffset"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CountryCallingCode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrencyCode"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContinentName"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
