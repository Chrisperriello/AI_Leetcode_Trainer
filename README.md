# St. Lawrence University Coding Trainer

A full-stack desktop application built by the St. Lawrence University Coding Club to help students learn and practice coding through interactive exercises with AI-powered feedback.

## About

**Created by:** Chris Perriello, Joe Davis, MJ Chao, and Seamus Burke

This project serves two purposes:

1. **Educational Tool** — Provides students with coding challenges, a built-in editor, and AI-assisted hints to develop problem-solving skills
2. **Proof of Concept** — Demonstrates that students can build production-quality full-stack applications with proper guidance and resources, serving as a template for future club projects

## Features

- 📝 Curated library of coding problems (easy, medium, hard)
- ✏️ Built-in Monaco code editor with syntax highlighting
- 🤖 AI-powered code analysis and hint system
- 💾 Local database to track progress and attempts
- 🔑 Pluggable API configuration — no setup required for end users

## Tech Stack

| Layer | Technology | Purpose |
|-------|------------|---------|
| Backend | Rust | Core application logic and API handling |
| Frontend | Svelte 5 | Reactive UI components |
| Framework | Tauri v2 | Lightweight desktop application shell |
| Database | SQLite via sqlx | Embedded relational data storage |
| Code Editor | Monaco Editor | VS Code-style editing experience |
| AI Integration | Anthropic Claude API | Code analysis and hint generation |
| Local Storage | tauri-plugin-store | Secure credential and preference storage |

### Why This Stack?

- **Rust + Tauri** — Ships smaller binaries than Electron with better performance and memory usage
- **Svelte 5** — Minimal boilerplate, reactive by default, great developer experience
- **SQLite** — Embedded database requiring no external server; ships with the app
- **Monaco** — Industry-standard editor that students already know from VS Code

## Project Structure

```
coding-trainer/
├── src-tauri/
│   ├── src/
│   │   ├── main.rs          # Application entry point
│   │   ├── db.rs            # SQLite setup and queries
│   │   ├── commands.rs      # Tauri IPC commands
│   │   └── ai.rs            # Claude API integration
│   ├── migrations/          # Database schema migrations
│   ├── Cargo.toml           # Rust dependencies
│   └── tauri.conf.json      # Tauri configuration
├── src/
│   ├── App.svelte           # Root component
│   ├── main.ts              # Svelte mount point
│   └── lib/
│       ├── components/
│       │   ├── ProblemPane.svelte   # Problem description display
│       │   ├── CodeEditor.svelte    # Monaco editor wrapper
│       │   └── AIFeedback.svelte    # AI hints and analysis
│       └── stores/          # Svelte state management
├── index.html               # Minimal HTML shell
├── package.json             # Node dependencies
└── README.md
```

## Prerequisites

Before you begin, ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v18 or higher)
- [Rust](https://rustup.rs/) (latest stable)
- Platform-specific dependencies for Tauri:
  - **macOS:** Xcode Command Line Tools (`xcode-select --install`)
  - **Windows:** Microsoft Visual Studio C++ Build Tools
  - **Linux:** See [Tauri Linux prerequisites](https://v2.tauri.app/start/prerequisites/#linux)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/coding-trainer.git
   cd coding-trainer
   ```

2. **Install Node dependencies**
   ```bash
   npm install
   ```

3. **Run in development mode**
   ```bash
   npm run tauri dev
   ```

4. **Build for production**
   ```bash
   npm run tauri build
   ```

## API Configuration

There is an GUI implmentation to configure the API key for the AI integration. This allows for seemless usage without
having to set up your own .env file


## Usage

The application is divided into three panels:

1. **Problem Pane (Left)** — Displays the current coding challenge with description, examples, and constraints
2. **Code Editor (Center)** — Write and edit your solution with full syntax highlighting
3. **AI Feedback (Right)** — Submit your code for analysis; receive feedback and one hint per attempt

## Contributing

We welcome contributions from St. Lawrence students and the broader community!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m "Add your feature"`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a Pull Request

## Development Roadmap

- [ ] Phase 1: Core UI layout and database setup
- [ ] Phase 2: Problem display and navigation
- [ ] Phase 3: Monaco editor integration
- [ ] Phase 4: AI feedback system
- [ ] Phase 5: Progress tracking and analytics
- [ ] Phase 6: Additional language support

## Resources

- [Tauri v2 Documentation](https://v2.tauri.app/)
- [Svelte 5 Documentation](https://svelte.dev/docs)
- [sqlx Documentation](https://github.com/launchbadge/sqlx)
- [Monaco Editor](https://microsoft.github.io/monaco-editor/)
- [Anthropic API Reference](https://docs.anthropic.com/en/api/messages)

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- St. Lawrence University Computer Science Department
- The Coding Club members who contributed ideas and testing
- The open-source communities behind Tauri, Svelte, and Rust


![Company Logo](./static/St._Lawrence_University.png)
