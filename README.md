# README

# 💎 Ruby on Rails Backend – Setup Guide

---

## 📦 1. Install Ruby with rbenv

### 🖥 Supported Platforms

* macOS (via Homebrew)
* Ubuntu / Debian Linux
* Windows (via WSL)

---

### 🍏 macOS (Homebrew)

1. **Install Homebrew** (if not installed):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install rbenv & ruby-build**:

   ```bash
   brew install rbenv ruby-build
   ```

3. **Initialize rbenv**:

   ```bash
   echo 'eval "$(rbenv init -)"' >> ~/.zshrc
   source ~/.zshrc
   ```

4. **Install Ruby 3.1.4**:

   ```bash
   rbenv install 3.1.4
   rbenv global 3.1.4
   ```

5. **Verify**:

   ```bash
   ruby -v
   ```

---

### 🐧 Ubuntu / Debian Linux

1. **Install dependencies**:

   ```bash
   sudo apt update
   sudo apt install -y git curl libssl-dev libreadline-dev zlib1g-dev \
     autoconf build-essential bison libyaml-dev libncurses5-dev \
     libffi-dev libgdbm-dev
   ```

2. **Install rbenv**:

   ```bash
   git clone https://github.com/rbenv/rbenv.git ~/.rbenv
   echo 'export PATH="\$HOME/.rbenv/bin:\$PATH"' >> ~/.bashrc
   echo 'eval "\$(rbenv init -)"' >> ~/.bashrc
   source ~/.bashrc
   ```

3. **Install ruby-build plugin**:

   ```bash
   git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
   ```

4. **Install Ruby 3.1.4**:

   ```bash
   rbenv install 3.1.4
   rbenv global 3.1.4
   ```

5. **Verify**:

   ```bash
   ruby -v
   ```

---

### 🪟 Windows (via WSL)

1. **Install WSL + Ubuntu** (follow Microsoft guide):

   [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

2. **Open Ubuntu terminal** and repeat the Ubuntu / Debian Linux steps above.

---

## 🚀 2. Rails 7.0 Backend Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-org/your-project.git
   cd your-project
   ```

2. **Install gems**:

   ```bash
   bundle install
   ```

3. **Configure the database**:

   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed   # optional
   ```

4. **Environment variables**:

   ```bash
   cp .env.example .env
   ```

   Or manage secrets via Rails credentials:

   ```bash
   bin/rails credentials:edit
   ```

5. **Start the server**:

   ```bash
   bin/rails server
   ```

   Open [http://localhost:3000](http://localhost:3000) in your browser.

---

# 🐘 How to Install PostgreSQL

---

## 🍏 macOS (Homebrew)

1. **Install Homebrew** (if not installed):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. **Install PostgreSQL**:

   ```bash
   brew install postgresql
   ```
3. **Start PostgreSQL service**:

   ```bash
   brew services start postgresql
   ```
4. **Verify installation**:

   ```bash
   psql --version
   ```

---

## 🐧 Ubuntu / Debian Linux

1. **Update packages**:

   ```bash
   sudo apt update
   ```
2. **Install PostgreSQL**:

   ```bash
   sudo apt install -y postgresql postgresql-client
   ```
3. **Start & enable service**:

   ```bash
   sudo systemctl start postgresql
   sudo systemctl enable postgresql
   ```
4. **Verify installation**:

   ```bash
   psql --version
   ```

---

## 🪟 Windows (via WSL)

1. **Install WSL + Ubuntu** (if not already installed):
   [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)
2. **Open Ubuntu terminal**.
3. **Follow Ubuntu/Debian steps above** to install and verify PostgreSQL.

---

## 🔧 Basic Usage

* **Connect to default database**:

  ```bash
  sudo -u postgres psql
  ```
* **Create a new database user**:

  ```sql
  CREATE ROLE myuser WITH LOGIN PASSWORD 'mypassword';
  ```
* **Create a database**:

  ```sql
  CREATE DATABASE mydb OWNER myuser;
  ```
* **Exit psql**:

  ```bash
  \q
  ```

# 🚀 Clone & Run the Project

---

## 6. Clone the Repository

```bash
# Replace the URL with your project's repository
git clone https://github.com/tungduong150105/Movie-Review-App-BE.git
cd Movie-Review-App-BE
```

## 7. Install Dependencies

Make sure you have Ruby 3.1 installed (via rbenv) and Bundler:

```bash
bundle install
```

## 8. Set Up the Database

Adjust `config/database.yml` with your database credentials, then:

```bash
bin/rails db:create    # Create the database
bin/rails db:migrate   # Run migrations
```

## 4. Start the Server

```bash
bin/rails server
```

Open your browser and visit: [http://localhost:3000](http://localhost:3000)

---

*Happy coding with Ruby & Rails!* 🎉

