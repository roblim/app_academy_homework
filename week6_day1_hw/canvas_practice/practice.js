document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'purple';
  ctx.fillRect(10, 10, 50, 20);
  ctx.beginPath();
  ctx.arc(40, 40, 30, 0, 6.28);
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = 'orange';
  ctx.fill();
  
});
