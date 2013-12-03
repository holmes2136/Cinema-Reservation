<%@ WebHandler Language="C#" Class="Reservation_do" %>

using System;
using System.Web;
using System.Web.Script.Serialization;


public class Reservation_do : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        var msg = new
        {
            Msg = "OK"
        };
        
        
        context.Response.ContentType = "application/json";
        context.Response.Write(new JavaScriptSerializer().Serialize(msg));
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}