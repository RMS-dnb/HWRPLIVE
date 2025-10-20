window.LoadingScreenConfig = {
    previewType: "images",   // "images" or "video"
    primaryColor: "#11b1daff", // Primary theme color
    logoURL: "./logo.png",

    rules: {
        title: "Server Rules",
        items: [
            {
                title: "General Conduct",
                description: "Be respectful to all players and staff members. No harassment, discrimination, or toxic behavior will be tolerated."
            },
            {
                title: "No Exploiting",
                description: "Using any bugs, glitches, or exploits to gain an unfair advantage is strictly prohibited and will result in a permanent ban."
            },
            {
                title: "Roleplay Standards",
                description: "Maintain high-quality roleplay at all times. Stay in character and avoid breaking immersion for other players."
            },
            {
                title: "RDM/Trolling Behavior",
                description: "Any sort of RDMing or trolling behavior will not be tolerated and will result in a permanent ban."
            },
            {
                title: "Communication",
                description: "Use appropriate methods for communication. No Third-Party calls."
            }
        ]
    },

    staff: {
        title: "Founders",
        members: [
            {
                name: "RMS",
                role: "Lead Developer and Founder",
        //      description: "One of the four server founders."
            },
            {
                name: "Rat",
                role: "Founder",
        //      description: "One of the four server founders."
            },
            {
                name: "Apollo",
                role: "Founder",
        //      description: "One of the four server founders."
            },
            
            {
                name: "Nutty",
                role: "Founder",
        //      description: "One of the four server founders."
            }
        ]
    },

    video: {
        intervalTime: 4000, // 4 seconds between content changes
        volume: 0.1,        // Video volume (0.0 to 1.0)
        src: "./sources/video.webm",
        contents: [
            {
                title: "Welcome to Highwater Roleplay",
                description: "Experience the world of the Highwater Union where roleplay and stories come first."
            },
            {
                title: "Active World Building",
                description: "Discover an ever-evolving world shaped by the lore and stories by the community."
            },
            {
                title: "Active Staff Suppport",
                description: "Experiencing issues in the server? Contact staff any time via the ticket system in Discord."
            },
            {
                title: "Getting Started in Highwater",
                description: "New to the world? Check out the Keybinds and Commands channel in the Discord for useful information."
            }
        ]
    },

    images: {
        intervalTime: 8000, // 3 seconds between image content changes
        bgMusic: "./sources/bg-audio.mp3",
        musicVolume: 0.1,   // Background music volume (0.0 to 1.0)
        sources: [
            {
                title: "Welcome to the Highwater Union",
                description: "After the assassination of Elijah Highwater during the signing of the New Austin Accords the territories have been thrown into turmoil.",
                src: "./sources/image-1.png"
            },
            {
                title: "Navigate the Union",
                description: "The territory of the Highwater Union is split between three regions: New Hanover, Lemoyne, and New Austin.",
                src: "./sources/image-2.png"
            },
            {
                title: "Meet the People",
                description: "Talking to the citizens of the Highwater Union is often the best method for obtaining information.",
                src: "./sources/image-3.png"
            },
            {
                title: "Essential Controls",
                description: "Master these vital controls to navigate the Union - [L-ALT] to interact with the world, [B] to open your inventory, [TAB] to see your weapons, and [M] to check your map.",
                src: "./sources/image-4.png"
            }
        ]
    }
}; 