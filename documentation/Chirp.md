# Chirp API

## `GET /chirps`

**Response:**

- Status Code: 200
  
Sample Response:

```json
{
	"chirp": "this is a chirp!",
}
```

## `POST /chirps`

**Body Parameters:**

- chirp: *string*


**Response:**

- Status Code: 201
  
Sample Response:

```json
{
	"chirp": "this is a chirp!"
}
```

## `PUT /chirps/:id`

**Body Parameters:**

- chirp: *string*


**Response:**

- Status Code: 204
  
Sample Response:

```json
{
	"chirp": "this is a chirp!"
}
```

## `DELETE /chirps/:id`

**Response:**

- Status Code: 200
  
Sample Response:

```json
{
	"success": "chirp eliminated"
}
```