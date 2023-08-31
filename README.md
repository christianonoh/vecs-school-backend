<a name="readme-top"></a>

<div align="center">
  <img src="./logo.png" alt="logo" width="300"  height="auto" />
  <br/>

  <!-- <h3><b>VECS SCHOOL BACKEND</b></h3> -->

</div>

<!-- TABLE OF CONTENTS -->
<details>
<summary> 📗 Table of Contents</summary>

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Link to frontend app](#live-demo)
  - [🚀 Link to VECS School Kanban Board](#kanban)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Team](#team)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
<!-- - [❓ FAQ (OPTIONAL)](#faq) -->
- [📝 License](#license)
</details>
<!-- PROJECT DESCRIPTION -->

# 📚💻🌐 VECS SCHOOL BACKEND <a name="about-project"></a>

Welcome to the backend repository of VECS School's course booking system. This API-only project, built with Ruby on Rails, powers the seamless booking of courses by enabling users to specify their city and preferred dates. It offers a comprehensive set of endpoints, ensuring efficient communication between frontend applications and the backend server.
## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li><a href="https://rubyonrails.org">Ruby on Rails (API-only mode)</a></li>
  </ul>
</details>


<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
  <summary>Authentication</summary>
  <ul>
    <li>JWT-based authentication</li>
  </ul>
</details>

<details>
  <summary>Documentation</summary>
  <ul>
    <li><a href="https://swagger.io/">Swagger</a></li></li>
  </ul>
</details>
<!-- Features -->

### Key Features <a name="key-features"></a>

- **Course Booking:**  Users can browse available courses, specify their city, and choose preferred dates for course attendance..

- **Endpoint Documentation:** Comprehensive API documentation is provided to guide frontend developers on how to interact with the backend.

- **User Authentication:** Secure user authentication and authorization mechanisms are implemented to protect sensitive user data and interactions.

- **Scalability:** Built with scalability in mind, the backend can handle a growing number of users and course offerings.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Link to Frontend<a name="live-demo"></a>

- Check out VECS SCHOOL frontend app [here.](https://github.com/smunoz1988/vecs-school-frontend)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Link to Kanban Board <a name="kanban"></a>

- Check out our kanban board [here.](https://github.com/users/christianonoh/projects/6/views/1)

- Check out our initial kanban board <a href='./src/assets/kanban0.png'>Here</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

Ensure you have Ruby installed on your system. You can check by running the code below in your terminal.
```sh
  ruby --version
```
### Setup

Clone or download the VECS School repository to your local machine.
```sh
  git clone https://github.com/christianonoh/vecs-school-backend.git
```
Open your terminal and navigate to the cloned project directory.

### Install

This project does not require additional dependencies, just Ruby interpreter. However, it uses Rubocop as a linter and you should set it up as well.

```sh
bundle install
```
**Credentials Setup:** Generate the master key.

- Delete the `config/credentials.yml.enc` file and run:

```sh
EDITOR="code --wait" rails credentials:edit
```
- This will generate new `config/master.key` and `config/credentials.yml.enc` files.

**Database Setup:** Navigate to the project directory and set up the database.
- In case it's necessary, add your database credentials to the `config/database.yml`.
- Run the following commands to create a database and run database migrations
```sh
rails db:create
rails db:migrate
rails db:seed
```
### Usage
Start the Rails server to run the application locally.

```sh
  rails server
```
Open your web browser and go to `http://localhost:3000/api/v1/` and add an endpoint to access your desired data.

## Running Tests <a name="run-tests"></a>

VECS School uses RSpec for testing. To run the tests, follow these steps:

- **Navigate to Project Directory:** Make sure you are in the project directory (`vecs-school-backend`).

- **Run Tests:** Use the following command to run the tests.
```sh
  bundle exec rspec spec/models 
  bundle exec rspec spec/controllers
```
- This will execute all the tests for the models and controllers directory and provide you with the results.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Team members<a name="team"></a>

- Final number of team members: 4. Details on [Authors](#authors)

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Christian Onoh**

- GitHub: [@christianonoh](https://github.com/christianonoh)
- Twitter: [@onohchristian](https://twitter.com/onohchristian)
- LinkedIn: [Christian Onoh](https://www.linkedin.com/in/christianonoh)

👤 **Vitoesi Elijah**

- GitHub: [@Ellyboi](https://github.com/Ellyboi)
- Twitter: [@elijahvitoesi](https://twitter.com/elijahvitoesi)
- LinkedIn: [@Elijah](https://www.linkedin.com/in/vitoesi-elijah-61961611a/)

👤 **Vanessa Oliveros Padron**

- GitHub: [@vvoo21](https://github.com/vvoo21)
- Twitter: [@vaneoliverosp](https://twitter.com/vaneoliverosp)
- LinkedIn: [vaneoliverosp](https://www.linkedin.com/in/vaneoliverosp/)

👤 **Santiago Munoz**

- GitHub: [@smunoz](https://github.com/smunoz1988)
- Twitter: [@twitterhandle](https://twitter.com/Santiag24209785)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/santiago-munoz-0b2b1a260)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **City and Date Filtering:** Courses can be filtered based on city and available dates, ensuring users find courses that match their preferences.
- [ ] **Feedback Mechanism:** Users can provide feedback on courses they've attended, helping improve the overall course quality.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

We're committed to continuously improving VECS School. If you encounter any issues or have suggestions for improvement, please [submit an issue](https://github.com/christianonoh/vecs-school-backend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it a star ⭐️. Thanks for your support!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>
Thanks to all the VECS School contributors/team.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
