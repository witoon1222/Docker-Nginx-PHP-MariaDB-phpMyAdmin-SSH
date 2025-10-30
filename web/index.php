<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
  <style>
    /* Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: #fff;
      text-align: center;
    }

    .welcome-container {
      padding: 40px 60px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 20px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
      backdrop-filter: blur(10px);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .welcome-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 50px rgba(0, 0, 0, 0.4);
    }

    h1 {
      font-size: 4rem;
      margin-bottom: 20px;
      text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
    }

    p {
      font-size: 1.5rem;
      opacity: 0.85;
    }

    @media (max-width: 600px) {
      h1 { font-size: 3rem; }
      p { font-size: 1.2rem; }
      .welcome-container { padding: 30px 20px; }
    }
  </style>
</head>
<body>
  <div class="welcome-container">
    <h1>Welcome</h1>
    <p>We are glad to see you here.</p>
  </div>
</body>
</html>
