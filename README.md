# 23aims-ollama
 23ai free with AI Microservices and Ollama

 This docker compose setup, deploys the following container:

| Container Name | Service                   |
| -------------- | ------------------------- |
| 23ai           | Oracle Database 23ai free |
| ords           | ORDS including APEX       |
| sql            | SQLcl                     |
| aims           | AI Microservices Sandbox  |


# Prerequisites
- Docker CE installed (include Docker Compose)
- Note: I have not tested Podman. There may be some changes required to the compose.yml in order to make it with with podman-compose

# Get Started
After cloning the repo, run the deploy script:

```
./deploy.sh
```

The deploy script will make sure that you have a directory for the database files and that some directories have the appropriate access priviliges.
It will also start the ```docker compose``` command.

Please note: The script starts docker compose in the foreground. If you prefer running it in the background modify the deploy.sh script by adding the flag ```-d``` to the docker compose command.

# Post Deployment DB Config
Once all containers are deployed, run the following command to start an interactive session in the SQLcl container:

```
sudo docker exec -it sql /bin/bash
```

Then start the init.sh script:

```
./init.sh
```

This script will load Oracle sample schemas (CO, SH, HR).
It will also create the user ```ora23ai```.
All users will be ORDS-enabled.

# Post Deployment Ollama Models
Now run the following command to start an interactive session in the Ollama container:

```
sudo docker exec -it ollama /bin/bash
```

Run:
```
ollama pull llama3.2
```

Once completed execute:

```
ollama pull all-minilm
```

Now, we have loaded llama3.2 LLM and the all-minilm embedding model.

# Start using AI Microservices Sandbox

Open the URL: http://<localhost:8501>

Replace localhost with the appropriate IP in case you are running this setup on a container.

Click on **database** and provide the database credentials as shown in the screenshot:
![](./images/db-config.png)

Then click on **Models** to enable Ollama as shown in the screenshot
![](./images/model-config.png)

Test the configuration by using the ChatBot:

![](./images/chatbot.png)

Now you can upload PDF and create embeddings which are stored in the database.

If you want to see the tables login to the database using SQL Developer Web:

```http://<localhost:8181>/ords```




