# MeeSignHelper

A helper tool to provide PDF-handling capabilities to [MeeSign server](https://github.com/crocs-muni/meesign-server) application.

## Usage

```bash
# Build the tool
mvn clean compile assembly:single

# Copy the built jar to your MeeSign directory
cp target/signPDF-1.0-SNAPSHOT-jar-with-dependencies.jar $MEESIGN/MeeSignHelper.jar
```

### Build with Nix

To build via Nix use

```bash
nix build
```

the `MeeSignHelper.jar` is then avaialble in `./result/` directory.
