# Space App

A Flutter app for exploring the planets of the solar system, with an
interactive 3D model for each planet.

## Screens

| Screen | What it does |
| --- | --- |
| **Welcome** | Full-bleed hero image with the entry point into the app. |
| **Explore Planets** | Swipeable carousel of all eight planets with arrow navigation. |
| **Planet Details** | Title, interactive 3D model, description, and a table of physical facts. |

## Stack

- **Flutter** (Dart SDK `^3.12.2`)
- **[provider](https://pub.dev/packages/provider)** — state management
- **[interactive_3d](https://pub.dev/packages/interactive_3d)** — GLB model rendering
- Native `Navigator` + `MaterialPageRoute` — no routing package

## Getting started

```bash
flutter pub get
flutter run
```

To build a release APK:

```bash
flutter build apk --release
```

## Project structure

Feature-first. Clean Architecture layers are applied only where there is real
complexity to justify them — there are no repositories or use cases, because
all data is static and local.

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   └── app_assets.dart          # every image and model path
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart           # the single ThemeData
│   └── widgets/                     # shared across features
│       ├── circle_icon_button.dart
│       ├── primary_action_button.dart
│       └── screen_header_banner.dart
└── features/
    ├── planets/
    │   ├── planet.dart              # immutable model
    │   └── planets_data.dart        # the eight planets, as const data
    ├── welcome/
    │   └── welcome_screen.dart
    ├── explore_planets/
    │   ├── explore_planets_screen.dart
    │   ├── explore_planets_provider.dart
    │   └── widgets/
    │       ├── explore_planet_button.dart
    │       └── planet_selector_row.dart
    └── planet_details/
        ├── planet_details_screen.dart
        └── planet_model_viewer.dart
```

A widget lives in `core/widgets/` only if it knows nothing about a specific
feature. Anything that reads a provider stays inside its feature's `widgets/`
folder.

## Architecture notes

### State management

Provider is used in exactly one place: `PlanetSelectionProvider`, which holds
the index of the currently selected planet on the Explore screen. Two widgets
in different branches of the tree need that value, which is the problem
Provider actually solves.

Everywhere else the smaller tool is the right one:

| State | Where it lives | Why |
| --- | --- | --- |
| Selected planet index | `PlanetSelectionProvider` | Read by two distant widgets |
| `PageController` | `_ExplorePlanetsBodyState` | A controller belongs to the widget that mounts it |
| 3D model load status | `_PlanetModelViewerState` | Nothing outside the viewer reads it |
| The displayed `Planet` | Constructor argument | Immutable, never changes while the screen is open |

The `PageView` is the single source of truth for the selection: both swiping
and the arrow buttons end up in `onPageChanged`, which is the only caller of
`selectPlanet`. That makes it impossible for the controller and the provider to
disagree.

### 3D rendering

`interactive_3d` gives no success or error callback for the native model load —
failures are swallowed internally. `PlanetModelViewer` therefore verifies the
asset itself with `rootBundle.load()` before mounting the viewer at all, and
falls back to the planet's still image if that check fails. The user never sees
an empty surface.

Two details that look redundant but are not:

- **`solidBackgroundColor`** must match `AppColors.background` exactly. It
  colors the native render surface; `backgroundColor` only paints the loading
  placeholder. A mismatch makes the viewer appear as a boxed-in rectangle.
- **`key: ValueKey(modelPath)`** forces a fresh viewer when the model changes,
  instead of Flutter reusing the widget and keeping the old model loaded.

## Assets

Planet images and `.glb` models live in `assets/images/` and `assets/models/`
and are referenced only through `AppAssets` — no hardcoded path strings.

Images are **WebP** (quality 90, lossless alpha), which is about 86% smaller
than the equivalent PNGs at the same dimensions. Keep new images in WebP.

### Fonts

Bundled from [Google Fonts](https://fonts.google.com), both under the SIL Open
Font License (license texts are in `assets/fonts/`):

- **Inter** — display headings
- **Space Grotesk** — everything else

Both are variable fonts, so `AppTextStyles` sets `fontVariations` alongside
`fontWeight`. Dropping `fontVariations` would silently fall back to the
default weight.
