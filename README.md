# ISS Digital Garden
This hosts the landing page, documentation, and growing digital garden for Intelligent Staffing Systems. 
It serves as a single reference point for collaborators, potential clients, and fellow experts. 

## Dev Guide
Clone this repo in the same directory as your obsidian. 
In scripts/ is a bidirectional-sync.sh.  Notice the paths at the top of the file. 
Adjust the obsidian path to the name of your obsidian project.
In your obsidian, create an iss-digital-garden directory, and move any files you wish to publish there. 
Create a branch for this repo. 
Run the bidirectional-sync.sh to push your changes to your branch.  Open a PR.  

### useful tip
Add the following to your bashrc for a convenient command for syncing directories:
```bash
obs-quartz-sync() {
    echo "Starting Obsidian-Quartz sync..."
    bash ~/scripts/bidirectional-sync.sh
    if [ $? -eq 0 ]; then
        echo "Sync completed successfully."
    else
        echo "Sync encountered an error. Please check the output above."
    fi
}
```


# About Quartz v4

> “[One] who works with the door open gets all kinds of interruptions, but [they] also occasionally gets clues as to what the world is and what might be important.” — Richard Hamming

Quartz is a set of tools that helps you publish your [digital garden](https://jzhao.xyz/posts/networked-thought) and notes as a website for free.
Quartz v4 features a from-the-ground rewrite focusing on end-user extensibility and ease-of-use.

🔗 Read the documentation and get started: https://quartz.jzhao.xyz/

[Join the Discord Community](https://discord.gg/cRFFHYye7t)

## Sponsors

<p align="center">
  <a href="https://github.com/sponsors/jackyzha0">
    <img src="https://cdn.jsdelivr.net/gh/jackyzha0/jackyzha0/sponsorkit/sponsors.svg" />
  </a>
</p>

