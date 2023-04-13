const express = require('express');
const app = express();
var dotenv = require('dotenv');
const axios = require('axios');
var request = require("request");
var path = require("path");
const multer = require('multer');
var FormData = require('form-data');
dotenv.config();
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

const port = process.env.PORT || 3015;

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

app.post("/user/otp/send", (req, res) => {
    console.log("send");
    console.log(req.body);
    var url = otp_service_url + "sendOTP";
   
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

app.post("/user/otp/verify", (req, res) => {
  console.log("verify");
  console.log(req.body);
  var url = otp_service_url + "verifyOTP";
 
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

app.post("/user/login", (req, res) => {
  //console.log(req.body);
  var url = otp_service_url + "login";
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

app.post("/user/welcome", (req, res) => {
    //console.log(req.body);
    var url = otp_service_url + "welcome";
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

app.post("/user/details/update", (req, res) => {
    //console.log(req.body);
    var url = otp_service_url + "details/update";
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

app.post("/user/address/update", (req, res) => {
    //console.log(req.body);
    var url = otp_service_url + "address/update";
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

app.post("/user/patient/update", (req, res) => {
    //console.log(req.body);
    var url = otp_service_url + "patient/update";
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

app.post("/user/patients/list", (req, res) => {
    //console.log(req.body);
    var url = otp_service_url + "patients/list";
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
app.post("/user/details", (req, res) => {
    console.log(req.body);
    var url = otp_service_url + "details";
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

app.post("/user/address/list", (req, res) => {
    console.log(req.body);
    var url = otp_service_url + "address/list";
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

app.post("/user/appointment/requests", (req, res) => {
    console.log(req.body);
    var url = otp_service_url + "appointment/requests";
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

app.post("/user/appointment/request/info", (req, res) => {
    var url = otp_service_url + "appointment/request/info";
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

app.post("/user/reviews", (req, res) => {
    console.log(req.body);
    var url = otp_service_url + "reviews";
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

app.post("/user/review/add", (req, res) => {
    console.log(req.body);
    var url = otp_service_url + "review/add";
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

app.post("/user/appointments/completed", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = otp_service_url + "appointments/completed";
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

app.post("/user/appointments/ongoing", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = otp_service_url + "appointments/ongoing";
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

app.post("/user/appointments/upcoming", (req, res) => {
    //console.log(req.body);
    //req.params['id']
    var url = otp_service_url + "appointments/upcoming";
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

app.post("/user/settings/info", (req, res) => {
    var url = otp_service_url + "settings/info";
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

app.post("/user/settings/save", (req, res) => {
    var url = otp_service_url + "settings/save";
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

app.post("/user/favourites/add", (req, res) => {
    var url = otp_service_url + "favourites/add";
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

app.post("/user/favourites/remove", (req, res) => {
    var url = otp_service_url + "favourites/remove";
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

app.post("/user/favourites", (req, res) => {
    var url = otp_service_url + "favourites";
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

app.post("/user/notifications", (req, res) => {
    var url = otp_service_url + "notifications";
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

app.post("/user/notifications/clearall", (req, res) => {
    var url = otp_service_url + "notifications/clearall";
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

app.post("/user/notifications/add", (req, res) => {
    var url = otp_service_url + "notifications/add";
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

app.post("/user/appointment/sessions", (req, res) => {
    var url = otp_service_url + "appointment/sessions";
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

app.post("/user/appointment/sessions/current", (req, res) => {
    var url = otp_service_url + "appointment/sessions/current";
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

app.post("/user/appointment/sessions/upcoming/count", (req, res) => {
    var url = otp_service_url + "appointment/sessions/upcoming/count";
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

app.post("/user/notifications/count", (req, res) => {
    var url = otp_service_url + "notifications/count";
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

app.post("/user/notifications/read", (req, res) => {
    var url = otp_service_url + "notifications/read";
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

app.post("/user/notifications/read/all", (req, res) => {
    var url = otp_service_url + "notifications/read/all";
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

app.post("/user/appointment/session/info", (req, res) => {
    var url = otp_service_url + "appointment/session/info";
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

app.post("/user/complaints/add", (req, res) => {
    var url = otp_service_url + "complaints/add";
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

app.post("/user/complaints", (req, res) => {
    var url = otp_service_url + "complaints";
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

app.post("/user/appointment/session/cancel", (req, res) => {
    var url = otp_service_url + "appointment/session/cancel";
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

app.post("/user/profile/image", (req, res) => {
    var url = otp_service_url + "profile/image";
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

app.post("/user/profile/image/upload", upload.single('file'), (req, res) => {
    const file = req.file;  
    console.log(file.originalname);

    //const { headers, files } = req;
    const buffer = file.buffer;
    const filename = file.originalname;
    //const { buffer, originalname: filename } = file;

    const formFile = new FormData();
    formFile.append('file', buffer, { filename });
    formFile.append('fileName', req.body.fileName);
    formFile.append('user_id', req.body.user_id);
    //headers['Content-Type'] = 'multipart/form-data';
    var url = otp_service_url + "profile/image/upload";
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

app.post("/user/patient/profile/image", (req, res) => {
    var url = otp_service_url + "patient/profile/image";
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

app.post("/user/patient/profile/image/upload", upload.single('file'), (req, res) => {
    const file = req.file;  
    console.log(file.originalname);

    //const { headers, files } = req;
    const buffer = file.buffer;
    const filename = file.originalname;
    //const { buffer, originalname: filename } = file;

    const formFile = new FormData();
    formFile.append('file', buffer, { filename });
    formFile.append('fileName', req.body.fileName);
    formFile.append('patient_id', req.body.patient_id);
    //headers['Content-Type'] = 'multipart/form-data';
    var url = otp_service_url + "patient/profile/image/upload";
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

app.post("/user/account/remove", (req, res) => {
    var url = otp_service_url + "account/remove";
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

app.post("/user/payment/confirm", (req, res) => {
    var url = otp_service_url + "payment/confirm";
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

app.post("/user/transaction/history", (req, res) => {
    var url = otp_service_url + "transaction/history";
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

app.listen(port, () => console.log(" Gateway is up & Running" + port));

module.exports = app;
