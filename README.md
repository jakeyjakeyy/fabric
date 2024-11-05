# Docker Fabric Runner

This repository creates a Docker image that runs Fabric on your local machine. It utilizes volumes and mounting to preserve your Fabric configuration, ensuring you only need to set it up once.

## Features

- Dockerized Fabric environment
- Persistent configuration through volume mounting
- Easy-to-use bash aliases for common operations

## Installation

1. Clone this repository:

   ```
   git clone https://github.com/jakeyjakeyy/docker-fabric-runner.git
   ```

2. Build the Docker image:

   ```
   cd docker-fabric-runner
   docker build -t fabric-runner .
   ```

3. Create config folder:

   ```
   mkdir .config/fabric/
   ```

4. Add the following aliases to your `.bashrc` or `.zshrc`:

   ```
   alias fabric='docker run --rm -i -v path/to/cloned/repository/fabric/.config/fabric:/root/.config/fabric fabric fabric'
   alias fabric-shell='docker run --rm -it -v path/to/cloned/repository/fabric/.config/fabric:/root/.config/fabric fabric'
   ```

   Ensure to replace `path/to/cloned/repository/` with the full path to the directory where you cloned this repository.

   Example:

   ```
   alias fabric='docker run --rm -i -v /home/jake/fabric/.config/fabric:/root/.config/fabric fabric fabric'
   alias fabric-shell='docker run --rm -it -v /home/jake/fabric/.config/fabric:/root/.config/fabric fabric'
   ```

5. Reload your shell or run `source ~/.bashrc` (or `~/.zshrc`) to apply the changes.

6. Run the following command to finish setting up Fabric and add your API keys:

   ```
   fabric --setup
   ```

## Usage

### Running Fabric Commands

Use the `fabric` alias to execute Fabric commands:

```
fabric [your-fabric-command]
```

For example, to submit prompts to an AI model:

```
echo "Hello, World!" | fabric -sp ai
```

### Interactive Shell

Use the `fabric-shell` alias to create an interactive terminal within the Docker container:

```
fabric-shell
```

This allows you to run any command available in the Docker image, such as:

```
ls
cat [filename]
```

## Example Usage

Here are some example commands you can try:

```
echo "Hello, World!" | fabric -sp ai
```

This example shows:

- Piping the string "Hello, World!" into the Fabric 'ai' pattern

```
fabric-shell fabric --youtube=https://www.youtube.com/watch?v=0VaeyqMK0GU --transcript | fabric -sp extract_song_meaning
```

This example shows:

- Gathering YouTube video transcript data
- Extracting the song meaning from the transcript

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request
