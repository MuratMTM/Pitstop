// utils/flagResolver.js
const FLAG_URLS = {
  'Great Britain': 'https://pitstop-backend-44xo.onrender.com/images/flags/gb.png',
  'Netherlands': 'https://pitstop-backend-44xo.onrender.com/images/flags/nl.png',
  'Brazil': 'https://pitstop-backend-44xo.onrender.com/images/flags/br.png',
  'Argentina': 'https://pitstop-backend-44xo.onrender.com/images/flags/ar.png',
  'Australia': 'https://pitstop-backend-44xo.onrender.com/images/flags/au.png',
  'Spain': 'https://pitstop-backend-44xo.onrender.com/images/flags/es.png',
  'Canada': 'https://pitstop-backend-44xo.onrender.com/images/flags/ca.png',
  'Japan': 'https://pitstop-backend-44xo.onrender.com/images/flags/jp.png',
  'China': 'https://pitstop-backend-44xo.onrender.com/images/flags/cn.png',
  'France': 'https://pitstop-backend-44xo.onrender.com/images/flags/fr.png',
  'Mexico': 'https://pitstop-backend-44xo.onrender.com/images/flags/mx.png',
  'Thailand': 'https://pitstop-backend-44xo.onrender.com/images/flags/th.png',
  'Denmark': 'https://pitstop-backend-44xo.onrender.com/images/flags/dk.png',
  'Finland': 'https://pitstop-backend-44xo.onrender.com/images/flags/fi.png',
  'Germany': 'https://pitstop-backend-44xo.onrender.com/images/flags/de.png',
  'Monaco': 'https://pitstop-backend-44xo.onrender.com/images/flags/mc.png',
  'Italy': 'https://pitstop-backend-44xo.onrender.com/images/flags/it.png',
  'New Zealand': 'https://pitstop-backend-44xo.onrender.com/images/flags/nz.png'
};

function normalizeCountry(country) {
  if (!country) return null;
  const c = String(country).trim();
  if (c === 'United Kingdom' || c === 'UK') return 'Great Britain';
  return c;
}

function resolveFlagUrl(country) {
  const key = normalizeCountry(country);
  if (!key) return null;
  return FLAG_URLS[key] || null;
}

module.exports = { resolveFlagUrl };
