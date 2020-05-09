'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "ced38afb4fd3e0f00214b7a7215e57a2",
"/": "ced38afb4fd3e0f00214b7a7215e57a2",
"main.dart.js": "4453122303e660ff9718f2b741280703",
"manifest.json": "54cb3d7f6a07cd44d78b4698fff12f4e",
"assets/AssetManifest.json": "a27f7af82b9cc0d27e72e599a6cd3fb5",
"assets/FontManifest.json": "b3d1c9ea0c36fce7b56886e3213c291d",
"assets/LICENSE": "96f5ef0fad34e54e365046b656b404c2",
"assets/assets/download.png": "91b62dcbcbff808e0f44a47315a568be",
"assets/assets/logo.png": "df1d1278f5379a8815986d2489ed2cb6",
"assets/assets/fonts/OpenSans-ExtraBold.ttf": "fb7e3a294cb07a54605a8bb27f0cd528",
"assets/assets/fonts/OpenSans-Regular.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
