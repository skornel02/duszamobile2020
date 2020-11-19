'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "5427d821816cf0dbcf5562baa2c25e50",
"main.dart.js": "dc44198ad1d6813884014ef4aeeb18d0",
"index.html": "2654a755470cc6a7fb1e14d2a262e0f7",
"/": "2654a755470cc6a7fb1e14d2a262e0f7",
"favicon.png": "f75f3881381c418986532dc720582aaa",
"assets/AssetManifest.json": "b2b56bc754638bcd5f4a25987668684a",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/FontManifest.json": "148de9d6449fef432226af3c3573f14d",
"assets/packages/progress_dialog/assets/double_ring_loading_io.gif": "e5b006904226dc824fdb6b8027f7d930",
"assets/packages/flutter_signin_button/assets/logos/google_light.png": "f71e2d0b0a2bc7d1d8ab757194a02cac",
"assets/packages/flutter_signin_button/assets/logos/3.0x/google_light.png": "fe46d37e7d6a16ecd15d5908a795b4ee",
"assets/packages/flutter_signin_button/assets/logos/3.0x/facebook_new.png": "12531aa3541312b7e5ddd41223fc60cb",
"assets/packages/flutter_signin_button/assets/logos/3.0x/google_dark.png": "ac553491f0002941159b405c2d37e8c6",
"assets/packages/flutter_signin_button/assets/logos/facebook_new.png": "e1dff5c319a9d7898aee817f624336e3",
"assets/packages/flutter_signin_button/assets/logos/google_dark.png": "c32e2778b1d6552b7b4055e49407036f",
"assets/packages/flutter_signin_button/assets/logos/2.0x/google_light.png": "8f10eb93525f0c0259c5e97271796b3c",
"assets/packages/flutter_signin_button/assets/logos/2.0x/facebook_new.png": "83bf0093719b2db2b16e2839aee1069f",
"assets/packages/flutter_signin_button/assets/logos/2.0x/google_dark.png": "937022ea241c167c8ce463d2ef7ed105",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "831eb40a2d76095849ba4aecd4340f19",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a126c025bab9a1b4d8ac5534af76a208",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d80ca32233940ebadc5ae5372ccd67f9",
"assets/assets/fonts/Manrope/Manrope-Regular.ttf": "0b726174d2b7e161b9e5e8125bf7751a",
"assets/assets/fonts/Manrope/Manrope-SemiBold.ttf": "255d425d09667bc095e79a8bd8081aba",
"assets/assets/fonts/Sura/Sura-Bold.ttf": "44e10725fbd4b4391fb3cb88621fcd18",
"assets/assets/fonts/Sura/Sura-Regular.ttf": "fca57740a1ad0e1296a32acba845618d",
"assets/assets/images/h%25C3%25A1tt%25C3%25A9r.png": "b8665c3e0905ab18ad036f8fc2fe8787",
"assets/assets/images/icon_orszagos.png": "8f6297ba05314713a53c65e73c9ab046",
"assets/assets/images/icon.png": "f75f3881381c418986532dc720582aaa",
"assets/assets/images/icon_hajdu-bihar.png": "ce36659563c7bd110c3cb77714ef024c",
"assets/assets/images/icon_komarom-esztergom.png": "da6540eb688de69f0e8b04c456b960a3",
"assets/assets/images/icon_csongrad-csanad.png": "fac1273ef45aa52a78b1c87f3468b7a0",
"assets/assets/images/icon_veszprem.png": "5c9506ede4acabb8daec8ded7a65aae8",
"assets/assets/images/icon_bacs-kiskun.png": "2aa75d0be9497edc4428c8749515e966",
"assets/assets/images/icon_pest.png": "2f9d3d97889da21a6f41f1aa74094803",
"assets/assets/images/icon_zala.png": "c0a9616e02446814431446d6eb998c51",
"assets/assets/images/icon_baz.png": "5a9e72b5727828e681bdee493b08135d",
"assets/assets/images/h%25C3%25A1tt%25C3%25A9r.svg": "d0e999111963639b5b99db0ca7c69307",
"assets/assets/images/icon_somogy.png": "b779a23d1edf2988eca883cc4a4b0cc0",
"assets/assets/images/icon_baranya.png": "83e4bfb281110bf011cca0f6b77c1415",
"assets/assets/images/icon_vas.png": "c6c2cc72b4be7727115df785488fa545",
"assets/assets/images/icon_tolna.png": "31b69f09dffb5cecaf8f7b6c26e982bf",
"assets/assets/images/icon_gyor-moson-sopron.png": "f5423ddbf722e8d5801edd83fdcff83f",
"assets/assets/images/icon_heves.png": "df933e6bc8143d477d232053426a7fbb",
"assets/assets/images/icon_szabolcs-szatmar-bereg.png": "5e6e4cf51904aef42914902b454ae8f1",
"assets/assets/images/icon_fejer.png": "88eef1fd7d0626253a5071989114178e",
"assets/assets/langs/en.json": "c4ec92a752d1b67e0ece3fa2173d3072",
"assets/assets/langs/hu.json": "efed2c07046874e3c339d7fc2c877dde",
"assets/NOTICES": "e8d7c78905493450199617c6c4b2d26b",
"manifest.json": "c5f07f8e9b9ec0a8961b38eb712cfee5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
