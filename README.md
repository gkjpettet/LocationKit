# LocationServices
A Xojo module for obtaining the geolocation from an IP from various 3rd party APIs.

The `LocationServices` module makes it easy to get information about the location of a computer based on its IP address. Currently the module supports three of the most popular gelocation APIs:

- [ipstack.co][ipapi]: Free plan available. No need for API key
- [ip-api.com][ip-api]: Free plan available. No need for API key
- [ipstack.com][ipstack]: Free plan available. Always requires an API key.

## Usage
First clone the project and copy the `LocationServices` module into your project.

Before using the module, set the provider (a predefined enumeration) that you wish to use. For example, to use ipapi.co:

```language-xojo
LocationServices.Provider = LocationServices.Providers.IPAPI
```

If you are on a paid plan you should also add your API key:

```language-xojo
LocationServices.APIKey = "YOUR_KEY_HERE"
```

The module has two `Get()` methods. Both require you to pass a callback with the following method signature:

```language-xojo
Method MyCallback(geo As LocationServices.Geolocation)
' Put the code to execute when the location is available here...
End Method
```

The `Get()` method can also accept an optional IP address. If passed then the moule will get the geolocation of the IP specified. If not passed then the IP address of the computer that the application is running on will be used. 

When the call to the API has been made successfully, the callback method you passed will be invoked and passed to it will be a `LocationServices.Geolocation` class containing information such as city, postal code, etc. Please note that different API providers populate different fields within this class.

[ipapi]: https://ipapi.co 
[ip-api]: http://ip-api.com
[ipstack]: https://ipstack.com
