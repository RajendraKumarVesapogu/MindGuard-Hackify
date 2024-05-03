# OpeninApp-Assignment


## API Instructions


### IDE:

recommended IDE for development : Visual Studio Code with all your extensinos for Node.js and mySQL.

Use thunderclient to test the API end points (Postman Alternative).

Use SQLTools as your database client to monitor the data (MySQL workbench alternative).


run `npm install` in the terminal to get all the requred dependensies.

### Environment Variables:

Please make a file `.env` as  and provide all the mentioned environment variables.

```
DB_NAME=''
DB_USER_NAME=''
DB_PASSWORD=''
DB_HOST=''
DB_DIALECT=''
DB_LOGGING=''

DB_FORCE=''

RUN_MODE=''
JWT_SECRET=''
SERVER_PORT=

TWILIO_AUTH_TOKEN=''
TWILIO_PHONE_NUMBER=''
TWILIO_SID=''
TWILIO_CALL_URL=''

```

These file names are added to new `.gitignore`



# Completd APIs:

## Auth:
End point : `host:port\auth\login`

##### POST ('\\'):

Body Structure :

```
{
"phone_number": "reqired"
}
```
<hr>

## Task:

End point : `host:port\task\all`

##### GET ('\\'):

```

    query.authtoken: "authToken"

```
Response Structure:

```
[    
    {
    "task_id": 23,
    "user_id": 1,
    "task_title": "Task3",
    "task_description": "Second Task",
    "task_due_date": "2024-03-24T00:00:00.000Z",
    "task_status": 0,
    "task_priority": 3,
    "is_deleted": false,
    "updatedAt": "2024-03-21T13:53:01.028Z",
    "createdAt": "2024-03-21T13:53:01.028Z"
    }
]
```
End point : `host:port\task\create`
##### POST ('\\'):

Body Structure :

```
query.authtoken: "authToken"
{
  "title":"required",
  "description":"optional",
  "due_date":"required"
}
```

Response Structure:

```
{
  "task_id": 23,
  "user_id": 1,
  "task_title": "Task3",
  "task_description": "Second Task",
  "task_due_date": "2024-03-24T00:00:00.000Z",
  "task_status": 0,
  "task_priority": 3,
  "is_deleted": false,
  "updatedAt": "2024-03-21T13:53:01.028Z",
  "createdAt": "2024-03-21T13:53:01.028Z"
}
```

End point : `host:port\task\update`
##### PUT ('\\'):

Body Structure :

```
query.authtoken: "authToken"
{
  "task_id":required(int)
  "status":"0", "1" or "2" required
  "due_date":"required"
}
```

Response Structure:

```
{
  "task_id": 23,
  "user_id": 1,
  "task_title": "Task3",
  "task_description": "Second Task",
  "task_due_date": "2024-03-24T00:00:00.000Z",
  "task_status": 0,
  "task_priority": 3,
  "is_deleted": false,
  "updatedAt": "2024-03-21T13:53:01.028Z",
  "createdAt": "2024-03-21T13:53:01.028Z"
}
```

End point : `host:port\task\delete`
##### PUT ('\\'):

Body Structure :

```
query.authtoken: "authToken"
{
  "task_id":required(int)
}
```

Response Structure:

```
{
  "task_id": 23,
  "user_id": 1,
  "task_title": "Task3",
  "task_description": "Second Task",
  "task_due_date": "2024-03-24T00:00:00.000Z",
  "task_status": 0,
  "task_priority": 3,
  "is_deleted": false,
  "updatedAt": "2024-03-21T13:53:01.028Z",
  "createdAt": "2024-03-21T13:53:01.028Z"
}
```


<hr>

## SubTask:

End point : `host:port\task\subtask\all`

##### GET ('\\'):

```

    query.authtoken: "authToken"
    query.task_id: "required"

```
Response Structure:

```
[
    {
        "sub_task_id": 27,
        "task_id": 20,
        "sub_task_title": "Second Sub Task",
        "sub_task_status": 0,
        "is_deleted": false,
        "updatedAt": "2024-03-21T13:54:14.629Z",
        "createdAt": "2024-03-21T13:54:14.629Z"
    }
]
```

End point : `host:port\task\subtask\create`
##### POST ('\\'):

Body Structure :

```
query.authtoken: "authToken"
{
  "task_id":"required",
  "sub_title":"required"
}
```

Response Structure:

```
{
  "sub_task_id": 27,
  "task_id": 20,
  "sub_task_title": "Second Sub Task",
  "sub_task_status": 0,
  "is_deleted": false,
  "updatedAt": "2024-03-21T13:54:14.629Z",
  "createdAt": "2024-03-21T13:54:14.629Z"
}
```

End point : `host:port\task\subtask\update`
##### PUT ('\\'):

Body Structure :

```
query.authtoken: "authToken"

{
  "sub_task_id": required
  "status": "0" or "1"
}
```

Response Structure:

```
{
  "sub_task_id": 27,
  "task_id": 20,
  "sub_task_title": "Second Sub Task",
  "sub_task_description": null,
  "sub_task_status": "1",
  "is_deleted": false,
  "createdAt": "2024-03-21T13:54:14.000Z",
  "updatedAt": "2024-03-21T13:54:44.516Z"
}
```

End point : `host:port\task\subtask\delete`
##### PUT ('\\'):

Body Structure :

```
query.authtoken: "authToken"

{
  "sub_task_id":required(int)
}
```

Response Structure:

```
{
  "sub_task_id": 27,
  "task_id": 20,
  "sub_task_title": "Second Sub Task",
  "sub_task_description": null,
  "sub_task_status": "1",
  "is_deleted": false,
  "createdAt": "2024-03-21T13:54:14.000Z",
  "updatedAt": "2024-03-21T13:54:44.516Z"
}
```

