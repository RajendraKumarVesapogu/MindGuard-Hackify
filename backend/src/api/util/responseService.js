var Responder = {
    SUCCESS:"Success",
    FAILED:"Failed",
    SERVER_ERROR:"Server Error",
    NOT_FOUND:"Page Not Found",
    respond:function(res,data,status,statusMessage,authToken){
        var response = {};
        response['status'] = status;
        response['statusMessage'] = statusMessage;
        if(data){
            response['data'] = data;
        }
        if(authToken){
            response['authToken'] = authToken;
            response['serverTime'] = new Date().getTime();
        }

        res.setHeader('Content-Type', 'application/json');
        if(status === this.NOT_FOUND){
            res.status(400);
        }else if(status === this.SERVER_ERROR){
            res.status(500);
        }
        res.send(response);
        res.end();
    },

    respondUnAuthentication:function(res){
        var response = {};
        response['status'] = this.FAILED;
        response['statusMessage'] = "Un authenticated request. Please login.";

        res.setHeader('Content-Type', 'application/json');
        res.send(response);
        res.end();
    },

    respondUnAuthorization:function(res){
        var response = {};
        response['status'] = this.FAILED;
        response['statusMessage'] = "Un authorized request.";

        res.setHeader('Content-Type', 'application/json');
        res.send(response);
        res.end();
    }
};
module.exports = exports = Responder;
