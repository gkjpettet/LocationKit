#tag Class
Protected Class IP_APISocket
Inherits Xojo.Net.HTTPSocket
	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  #Pragma Unused HTTPStatus
		  #Pragma Unused url
		  
		  ' Try to convert the MemoryBlock to Text
		  Dim json As Text
		  Try
		    json = Xojo.Core.TextEncoding.UTF8.ConvertDataToText(content)
		  Catch err
		    Return
		  End Try
		  
		  ' Try to convert the received JSON to a dictionary.
		  Dim dict As Xojo.Core.Dictionary
		  Try
		    dict = Xojo.Data.ParseJSON(json)
		  Catch err
		    Return
		  End Try
		  
		  ' Was there an error returned by IP-API?
		  If dict.Lookup("status", "fail") = "fail" Then
		    Dim msg As Text = dict.Lookup("message", "An error occurred during location lookup from ip-api.com")
		    Raise New LocationServices.Error(msg)
		  End If
		  
		  ' Try to convert the received dictionary to a Geolocation object.
		  Dim geo As LocationServices.Geolocation = LocationServices.IP_API.JSONDictToLocation(dict)
		  
		  ' Invoke the callback method, passing it the Geolocation object.
		  Callback.Invoke(geo)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(callback As LocationServices.LocationObtained)
		  ' Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Callback = callback
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Callback As LocationServices.LocationObtained
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidateCertificates"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
