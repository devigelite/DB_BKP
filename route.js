const express = require('express');
const app = express();
var dotenv = require('dotenv');
const axios = require('axios');
var request = require("request");
var path = require("path");
//const fileUpload = require('express-fileupload');
const multer = require('multer');
var FormData = require('form-data');
dotenv.config();
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const port = process.env.PORT || 3005;

const otp_service_url = process.env.OTP_SERVICE;

const nurse_service_url = process.env.NURSE_SERVICE;
//http://localhost:3002/
//const otp_service_url = "http://"+'host.docker.internal'+":"+"3002"+"/";
//"../schemas/appointments_definition.yaml"
//host.docker.internal
console.log(port);
console.log(otp_service_url);

console.log(path.dirname(__filename));
app.use(
    express.urlencoded({
      extended: true,
    })
  );
app.use(express.json());

app.post("/nurse/details", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "details";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/address/list", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "address/list";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/otp/send", (req, res) => {
    console.log("send");
    console.log(req.body);
    var url = nurse_service_url + "sendOTP";
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'content-type' : req.headers['content-type']
          },
          data: req.body 
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});
///nurse/otp/verify
app.post("/nurse/otp/verify", (req, res) => {
    console.log("verify");
    console.log(req.body);
    var url = nurse_service_url + "verifyOTP";
   
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'content-type' : req.headers['content-type']
          },
          data: req.body 
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
  });
 
app.post("/nurse/details/update", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "details/update";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/address/update", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "address/update";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/login", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "login";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body        
      }).then(
              (response) => {
                  const respJSON = JSON.stringify(response.data); 
                  console.log("respJSON" + respJSON);
                  res.status(200).send(response.data);
          }).catch((err) => {
              //console.log('ERROR :', err);
              console.log("err");
              res.send(err);
          });
      }catch (e) {
          console.error('Failure!');
          console.error(e.response.status);
          throw new Error(e);
      }
});
  
app.post("/nurse/welcome", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "welcome";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token
          }          
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/request/accept", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "appointment/request/accept";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/request/reject", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "appointment/request/reject";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/start", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "appointment/start";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/end", (req, res) => {
    //console.log(req.body);
    var url = nurse_service_url + "appointment/end";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/requests", (req, res) => {
    var url = nurse_service_url + "appointment/requests";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

///nurse/appointment/request/info
app.post("/nurse/appointment/request/info", (req, res) => {
    var url = nurse_service_url + "appointment/request/info";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/notifications/read", (req, res) => {
    var url = nurse_service_url + "notifications/read";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/notifications/read/all", (req, res) => {
    var url = nurse_service_url + "notifications/read/all";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/notifications/count", (req, res) => {
    var url = nurse_service_url + "notifications/count";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/sessions/upcoming/count", (req, res) => {
    var url = nurse_service_url + "appointment/sessions/upcoming/count";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/sessions/current", (req, res) => {
    var url = nurse_service_url + "appointment/sessions/current";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointments/completed", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "appointments/completed";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);

    
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointments/ongoing", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "appointments/ongoing";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointments/upcoming", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "appointments/upcoming";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/available/slots", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "available/slots";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/open/slots", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "open/slots";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/fees/info", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "fees/info";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/fees/save", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = nurse_service_url + "fees/save";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/search/list", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "search/list";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/profile", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "profile";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/request/book/liveincare", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "appointment/request/book/liveincare";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/request/book/singlevisit", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "appointment/request/book/singlevisit";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/request/book/recurringvisit", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "appointment/request/book/recurringvisit";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/myearnings", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "myearnings";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/reviews", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "reviews";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/review/add", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "review/add";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appoinment/sessions", (req, res) => {
    var url = nurse_service_url + "appoinment/sessions";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/session/info", (req, res) => {
    var url = nurse_service_url + "appoinment/session/info";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/start/sendotp", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "appointment/start/sendotp";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/appointment/end/sendotp", (req, res) => {
    console.log(req.body);
    var url = nurse_service_url + "appointment/end/sendotp";
    console.log(url);
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
              'x-access-token' : access_token,
              'content-type' : req.headers['content-type']
          },
          data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log(respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});


app.post("/nurse/settings/info", (req, res) => {
    var url = nurse_service_url + "settings/info";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/settings/save", (req, res) => {
    var url = nurse_service_url + "settings/save";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/notifications", (req, res) => {
    var url = nurse_service_url + "notifications";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/notifications/clearall", (req, res) => {
    var url = nurse_service_url + "notifications/clearall";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/notifications/add", (req, res) => {
    var url = nurse_service_url + "notifications/add";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/complaints/add", (req, res) => {
    var url = nurse_service_url + "complaints/add";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/complaints", (req, res) => {
    var url = nurse_service_url + "complaints";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/reports", (req, res) => {
    var url = nurse_service_url + "reports";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/profile/image", (req, res) => {
    var url = nurse_service_url + "profile/image";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/profile/image/upload", upload.single('file'), (req, res) => {
    const file = req.file;  
    console.log(file.originalname);

    //const { headers, files } = req;
    const buffer = file.buffer;
    const filename = file.originalname;
    //const { buffer, originalname: filename } = file;

    const formFile = new FormData();
    formFile.append('file', buffer, { filename });
    formFile.append('fileName', req.body.fileName);
    formFile.append('nurse_id', req.body.nurse_id);
    //headers['Content-Type'] = 'multipart/form-data';
    var url = nurse_service_url + "profile/image/upload";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    console.log(req.headers['content-type']);
    console.log(req.file.mimetype);
    console.log(req.body);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: formFile
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.post("/nurse/account/remove", (req, res) => {
    var url = nurse_service_url + "account/remove";
    var access_token = req.headers['x-access-token'] ? req.headers['x-access-token'] : "";
    console.log(access_token);
    console.log(url);
    try{
      axios({
          method: req.method,
          url: url,
          headers: {
            'x-access-token' : access_token,
            'content-type' : req.headers['content-type']
        },
        data: req.body
    }).then(
          (response) => {
              const respJSON = JSON.stringify(response.data); 
              console.log("respJSON" + respJSON);
              res.status(200).send(response.data);
      }).catch((err) => {
          //console.log('ERROR :', err);
          console.log("err");
          res.send(err);
      });
  }catch (e) {
      console.error('Failure!');
      console.error(e.response.status);
      throw new Error(e);
  }
});

app.listen(port, () => console.log(" Gateway is up & Running " + port));

module.exports = app;