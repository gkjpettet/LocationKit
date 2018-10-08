#tag Module
Protected Module LocationServices
	#tag Method, Flags = &h1
		Protected Sub Get(callback As LocationServices.LocationObtained)
		  ' Get the geolocation for this computer's current IP address using the desired provider.
		  ' Invokes the passed callback delegate when the geolocation is available.
		  ' Note, not all providers can automatically determine your IP. If this is the case then 
		  ' this method raises a LocationServices.Error exception.
		  
		  Select Case Provider
		  Case Providers.IP_API
		    IP_API.Get(callback)
		  Case Providers.IPAPI
		    IPAPI.Get(callback)
		  Case Providers.IPStack
		    IPStack.Get(callback)
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Get(ip As Text, callback As LocationServices.LocationObtained)
		  ' Get the geolocation for the specified IP address using the desired provider.
		  ' Invokes the passed callback delegate when the geolocation is available.
		  
		  Select Case Provider
		  Case Providers.IP_API
		    IP_API.Get(ip, callback)
		  Case Providers.IPAPI
		    IPAPI.Get(ip, callback)
		  Case Providers.IPStack
		    IPStack.Get(ip, callback)
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub LocationObtained(geo As LocationServices . Geolocation)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Function ProviderAsText() As Text
		  Select Case Provider
		  Case Providers.IPAPI
		    Return "ipapi.co"
		  Case Providers.IP_API
		    Return "ip-api.com"
		  Case Providers.IPStack
		    Return "ipstack.com"
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ValidIP(ip As Text) As Boolean
		  ' Returns True if this is a valid IPV4 address.
		  
		  Dim parts() As Text = ip.Split(".")
		  
		  If parts.Ubound <> 3 Then Return False
		  
		  Dim i As Integer
		  For Each part As Text In parts
		    Try
		      i = Integer.FromText(part)
		      If i <= 0 Or i > 255 Then Return False
		    Catch err As Xojo.Core.BadDataException
		      Return False
		    End Try
		  Next part
		  
		  Return True
		End Function
	#tag EndMethod


	#tag Note, Name = About
		The Location module provides geolocation data from a given IP. Currently the only 
		implemented provider is ip-api.com
		
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected APIKey As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Pro As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Provider As LocationServices.Providers = LocationServices.Providers.IP_API
	#tag EndProperty


	#tag Constant, Name = Version, Type = Text, Dynamic = False, Default = \"1.0.0", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = Providers, Type = Integer, Flags = &h1
		IP_API
		  IPAPI
		IPStack
	#tag EndEnum


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
