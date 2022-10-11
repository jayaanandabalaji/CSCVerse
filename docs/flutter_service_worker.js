'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "a1443fe184cc229c8dfc6c8378c409fd",
"assets/assets/accelerator.png": "9a26e971659430827eeebca360fe17ac",
"assets/assets/bg.png": "e76ffc800abd2148424f823cc55ac452",
"assets/assets/bg1.png": "afb19c8fa359233fa9e18c26f96d3096",
"assets/assets/brake.png": "8bf94f092ad75f379e53a9e06b10c444",
"assets/assets/cars/white/1.png": "1f17ceac489f866d32a16888439ae836",
"assets/assets/cars/white/10.png": "8e9fffda2036a5378b524ead6a5544d3",
"assets/assets/cars/white/11.png": "f0d897628804d94fb0a5def4cfe38321",
"assets/assets/cars/white/12.png": "37963e4a8537a26d1b339df241e72a4a",
"assets/assets/cars/white/13.png": "a4464f07734e6ef54989960a912d24c9",
"assets/assets/cars/white/14.png": "2fb718ce4b4175b7302f05cfa081d830",
"assets/assets/cars/white/15.png": "692c01d6243ff6432fb731f2e6a95fde",
"assets/assets/cars/white/16.png": "3e756f88d50eb3de6ea942b58d2e3847",
"assets/assets/cars/white/17.png": "fea8def675196a0d98d1dd1deb1cec25",
"assets/assets/cars/white/18.png": "59025967ee8dc45815fa439a4be8dba9",
"assets/assets/cars/white/19.png": "40e1ef6a6da10e8dcd9a113abd1763d0",
"assets/assets/cars/white/2.png": "f334347bcdbf301e73fb11ef8c2ab9fd",
"assets/assets/cars/white/20.png": "32af2763e46a21b213a79a8fcfdbe19a",
"assets/assets/cars/white/21.png": "d86f686d4e963c32dbc95eb5bc61d921",
"assets/assets/cars/white/22.png": "ea2cfddbf08957b7670f1fe5b4633689",
"assets/assets/cars/white/23.png": "bd0447d1a571387b4fd1b4a00a5b94cc",
"assets/assets/cars/white/24.png": "c90a43486a4d997e89bbea933d739706",
"assets/assets/cars/white/25.png": "9cddffa32cd334ecf4606c551684c1d9",
"assets/assets/cars/white/26.png": "968ef46d02b6f1bc36b8ec06936fdf56",
"assets/assets/cars/white/27.png": "f746bb258627edffe6fa2aaeaf33612d",
"assets/assets/cars/white/28.png": "6995858f01e32b01d064a789a098813f",
"assets/assets/cars/white/29.png": "2dc5bcc007308842c3e5fffe6f0f8b7b",
"assets/assets/cars/white/3.png": "7ad446d4e34627178e835ab5e72de9e9",
"assets/assets/cars/white/30.png": "474ccf1776d6fe0e30627bf0da5e8f4b",
"assets/assets/cars/white/31.png": "f78beefc784f4993205dce9d963fdb3c",
"assets/assets/cars/white/32.png": "e3fb25d0da8c688926287830aa0c675a",
"assets/assets/cars/white/33.png": "5f4a8b98317772841334dc2dcd0bf150",
"assets/assets/cars/white/34.png": "3118891803a9f07c8e17af5f4b8f40ca",
"assets/assets/cars/white/35.png": "da3a7bd1742472a7f63fd66d861fb0bd",
"assets/assets/cars/white/36.png": "11bd1fca38e8de0a47ccf389fba9c184",
"assets/assets/cars/white/37.png": "aacef90dddb233351d30e0247b0fa2b9",
"assets/assets/cars/white/38.png": "e591c03b920d902043b6a6b59b29301c",
"assets/assets/cars/white/39.png": "61710fe25f88e17324f388daa777c5ef",
"assets/assets/cars/white/4.png": "43e6b234e7ef3d1cc2a245623a19322c",
"assets/assets/cars/white/40.png": "0dd934b9c439bc2d362aeb4180fa3cad",
"assets/assets/cars/white/41.png": "6b727590a1e9ef1c2d1e1109a7886054",
"assets/assets/cars/white/42.png": "193996018d61d53979fd4a7c1263e29a",
"assets/assets/cars/white/43.png": "b3759f72394a7b33e3c3d53eb2fd9cde",
"assets/assets/cars/white/44.png": "38a8801c934a869c1b85d39cfc5fb958",
"assets/assets/cars/white/45.png": "c3792415e57026d5812e3083304151bb",
"assets/assets/cars/white/46.png": "1e9b05dca8336acca4e3f7dc4ee2131c",
"assets/assets/cars/white/47.png": "5d98c12f830c9115c59ae03f24d8c57e",
"assets/assets/cars/white/48.png": "c51304c7b96e991a4aaf7bf6aedacc71",
"assets/assets/cars/white/49.png": "4397be3e9c6aa3cdd3ab466ddbf76750",
"assets/assets/cars/white/5.png": "c146020764a43c28393cb5d97cd20f4c",
"assets/assets/cars/white/50.png": "ba0e7f74d11665657150e1570676fcd9",
"assets/assets/cars/white/51.png": "3b36d95b274ea57645c4dce3c213f399",
"assets/assets/cars/white/52.png": "1f17ceac489f866d32a16888439ae836",
"assets/assets/cars/white/6.png": "902bc51c5c142dd9ffff23d4edc1987f",
"assets/assets/cars/white/7.png": "87e0550215325c178da4b1ae192336db",
"assets/assets/cars/white/8.png": "14d69c5fcb5b92f1cb2b9d218afcaa68",
"assets/assets/cars/white/9.png": "b783e98db8e506ab4824add73c72708d",
"assets/assets/coinex.png": "67f2bd147a3e522e24cd5e321547e47c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "0d6284c62fb0f6ac91e0308b946f12ed",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "ae6c1fd6f6ee6ee952cde379095a8f3f",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4972f846441a8b527cad7c348d52f6cf",
"/": "4972f846441a8b527cad7c348d52f6cf",
"main.dart.js": "0e4a50e691b6632986e6e723fa23f1bb",
"manifest.json": "4b2afd57406a3fe32800864061271bc3",
"version.json": "fc09bebcef1a973ee3ae7db20ac8bb54"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
