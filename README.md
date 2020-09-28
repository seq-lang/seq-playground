# Seq Playground

Seq playground for compiling and running code remotely

## Requirements

- Python 3
- Flask
- Docker

## Usage

1. Build Docker image:
    ```bash
    docker build -t seq-playground .
   ```
2. Run Flask app; e.g.
    ```bash
    gunicorn -w 4 -b 157.230.95.210:8000 seq-playground:app
    ```
3. Send a POST request to `/seq_exec` endpoint; e.g.
    ```bash
    curl -i -X POST -H 'Content-Type: application/json' -d '{"code": "print 2 + 2"}' http://157.230.95.210:8000/seq_exec
    ```

## JavaScript example

```javascript
var code = 'print 2 + 2'
$.ajax({
    url: 'http://157.230.95.210:8000/seq_exec',
    dataType: 'text',
    type: 'post',
    contentType: 'application/json',
    data: JSON.stringify({'code': code}),
    processData: false,
    success: function(data, textStatus, jQxhr) {
        // remove error code ANSI colors
        var dataClean =
          data.replace(/[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><]/g, '');
        $('#result').html(dataClean);
    },
    error: function(jqXhr, textStatus, errorThrown) {
        $('#result').html('error: could not communicate with execution server');
    }
});
```

## Notes

If you see the following warning from Docker:

<pre>
	WARNING: Your kernel does not support swap limit capabilities
	or the cgroup is not mounted. Memory limited without swap.
</pre>

follow the instructions [here](https://www.serverlab.ca/tutorials/containers/docker/how-to-limit-memory-and-cpu-for-docker-containers/) to resolve it.
