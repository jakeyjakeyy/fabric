# Show usage if no arguments provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 [-sp <prompt> <pattern> | --transcript <youtube_url> <pattern>]"
    exit 1
fi

# Check first argument
case "$1" in
    "-sp")
        if [ $# -ne 3 ]; then
            echo "Usage for -sp: $0 -sp <prompt> <pattern>"
            exit 1
        fi
        prompt="$2"
        pattern="$3"
        if ! echo "$prompt" | docker run --rm -i -v /home/jake/fabric/.config/fabric:/root/.config/fabric fabric fabric -sp "$pattern"; then
            echo "Error: Command execution failed"
            exit 2
        fi
        ;;
        
    "--transcript")
        if [ $# -ne 3 ]; then
            echo "Usage for --transcript: $0 --transcript <youtube_url> <pattern>"
            exit 1
        fi
        youtube_url="$2"
        pattern="$3"
        if ! docker run --rm -it -v /home/jake/fabric/.config/fabric:/root/.config/fabric fabric fabric --youtube="$youtube_url" --transcript | docker run --rm -i -v /home/jake/fabric/.config/fabric:/root/.config/fabric fabric fabric -sp "$pattern"; then
            echo "Error: Command execution failed"
            exit 2
        fi
        ;;
        
    *)
        echo "Invalid first argument. Use either -sp or --transcript"
        exit 1
        ;;
echo ""
esac
