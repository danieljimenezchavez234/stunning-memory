<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Botón corazón con frases especiales y fondo bonito</title>
<style>
  /* Animación de fondo degradado */
  @keyframes gradientAnimation {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }

  body {
    min-height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    color: #333;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;

    /* Fondo degradado animado */
    background: linear-gradient(270deg, #ff9a9e, #fad0c4, #fad0c4, #ff9a9e);
    background-size: 800% 800%;
    animation: gradientAnimation 20s ease infinite;
  }

  #loveBtn {
    position: relative;
    z-index: 10;
    font-size: 4rem;
    background: #ff69b4;
    border: none;
    border-radius: 50%;
    width: 120px;
    height: 120px;
    cursor: pointer;
    color: white;
    box-shadow: 0 6px 15px rgba(255, 105, 180, 0.5);
    transition: background-color 0.3s ease, transform 0.2s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    user-select: none;
  }
  #loveBtn:hover {
    background: #ff4f81;
    transform: scale(1.1);
  }
  .phrase {
    position: absolute;
    z-index: 20;
    color: #fff;
    background: linear-gradient(135deg, #ff6a9e, #ff3d7f);
    padding: 6px 14px;
    border-radius: 20px;
    font-weight: bold;
    white-space: nowrap;
    user-select: none;
    pointer-events: none;
    box-shadow: 0 4px 12px rgba(255, 61, 127, 0.8);
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
    opacity: 1;
    animation-fill-mode: forwards;
    animation-timing-function: ease-out;
  }
</style>
</head>
<body>

<button id="loveBtn" aria-label="Botón corazón">❤️</button>

<script>
  const phrasesOriginal = [
     "al final hay un consejor y un tips para quien sea a si que verlo todo",
          "burnoos..comenamos",
    "pudiera usted bella y hermosa mujer perdoname.",
    "no puedo dejarte,simplemnte no puedo,ojala y lo entienda",
    "tu durante 1 año y ms,aun era mi fuego,mi sopporte...",
    "hasta entendi qye ya nunca va a volver",
    "pero sigo aqui,haciendo cuaquier tipp de detalles.",
    "te verdad,no importa los mas de 200 dias.",
    "aun te edxtaño y siempre lo voy a hacer.",
    "sin importa si estoy con alguien mas",
    "sin importa lo que sea ni donde sea.",
    "mi mente y corazon siempre esta contigo ",
    "ojala y vea eso ,hoy o mañana o el dia que vea",
    "Naturalmente hermosa y bella eres,.",
    "no te quiero dañar tu felicidad pero si mne ocupa aqui estoy ",
    "te extaño un monton ,nunca me ovy a cansar de decir eso",
    "alguien es todop ara ti y yo soy todo para ti ",
    "es la 2 am,no puedo dormi por el cri,,,esa cosa es mala nnuva lo consuman"
  ];

  let phrases = [...phrasesOriginal];

  const loveBtn = document.getElementById('loveBtn');

  const directions = [
    { x: 0, y: -120 },
    { x: -80, y: -100 },
    { x: 80, y: -100 },
    { x: -120, y: 0 },
    { x: 120, y: 0 },
    { x: -80, y: -40 },
    { x: 80, y: -40 },
    { x: 0, y: -150 }
  ];

  loveBtn.addEventListener('click', () => {
    if (phrases.length === 0) {
      phrases = [...phrasesOriginal];
    }

    const index = Math.floor(Math.random() * phrases.length);
    const phraseText = phrases.splice(index, 1)[0];

    const phraseEl = document.createElement('span');
    phraseEl.className = 'phrase';
    phraseEl.textContent = phraseText;

    const rect = loveBtn.getBoundingClientRect();
    phraseEl.style.left = rect.left + rect.width / 2 + 'px';
    phraseEl.style.top = rect.top + rect.height / 2 + 'px';
    phraseEl.style.transform = 'translate(-50%, -50%)';

    const dir = directions[Math.floor(Math.random() * directions.length)];
    const duration = 7000; // 7 segundos

    phraseEl.animate([
      { transform: 'translate(-50%, -50%) translate(0, 0)', opacity: 1 },
      { transform: `translate(-50%, -50%) translate(${dir.x}px, ${dir.y}px) scale(1.2)`, opacity: 0 }
    ], {
      duration: duration,
      easing: 'ease-out',
      fill: 'forwards'
    });

    document.body.appendChild(phraseEl);

    setTimeout(() => {
      phraseEl.remove();
    }, duration);
  });
</script>

</body>
</html>
