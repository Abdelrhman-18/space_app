import 'package:space_app/core/constants/app_assets.dart';
import 'package:space_app/features/planets/planet.dart';

const List<Planet> planetsData = [
  Planet(
    name: 'Mercury',
    imagePath: AppAssets.mercuryImage,
    modelPath: AppAssets.mercuryModel,
    viewerZoom: 2.0,
    title: 'Mercury: The Closest Planet',
    about:
        "Mercury is the smallest planet in our solar system and the one "
        "closest to the Sun. It has almost no atmosphere to trap heat, so "
        "its surface swings between scorching days and freezing nights — "
        "the most extreme temperature range of any planet. Its heavily "
        "cratered, airless surface closely resembles the Moon's, a record "
        "of billions of years of impacts. Mercury also has the shortest "
        "year of any planet, completing a full orbit around the Sun in "
        "just 88 Earth days.",
    distanceFromSunKm: '57,909,227',
    lengthOfDayHours: '1,407.60',
    orbitalPeriodYears: '0.24',
    radiusKm: '2,439.70',
    massKg: '3.301 × 10²³',
    gravityMs2: '3.7',
    surfaceAreaKm2: '7.48 × 10⁷',
  ),
  Planet(
    name: 'Venus',
    imagePath: AppAssets.venusImage,
    modelPath: AppAssets.venusModel,
    viewerZoom: 2.0,
    title: "Venus: Earth's Toxic Twin",
    about:
        "Venus is often referred to as Earth's twin due to its similar "
        "size and composition. However, its thick atmosphere, composed "
        "primarily of carbon dioxide, traps heat, making it the hottest "
        "planet in our solar system. This greenhouse effect has created a "
        "hostile environment with temperatures hot enough to melt lead. "
        "Venus is also shrouded in a thick layer of sulfuric acid clouds, "
        "which reflect sunlight and give it a yellowish appearance.",
    distanceFromSunKm: '108,209,072',
    lengthOfDayHours: '5,832.20',
    orbitalPeriodYears: '0.62',
    radiusKm: '6,051.80',
    massKg: '4.867 × 10²⁴',
    gravityMs2: '8.87',
    surfaceAreaKm2: '4.60 × 10⁸',
  ),
  Planet(
    name: 'Earth',
    imagePath: AppAssets.earthImage,
    modelPath: AppAssets.earthModel,
    viewerZoom: 2.0,
    title: 'Earth: Our Blue Marble',
    about:
        "Earth is the only known planet in the universe that supports "
        "life. Its unique combination of factors, including liquid "
        "water, a breathable atmosphere, and a suitable distance from "
        "the Sun, has created the ideal conditions for the development "
        "of complex organisms. Earth's magnetic field protects it from "
        "harmful solar radiation, and its atmosphere helps to regulate "
        "temperature and weather patterns.",
    distanceFromSunKm: '149,598,026',
    lengthOfDayHours: '23.93',
    orbitalPeriodYears: '1',
    radiusKm: '6,371',
    massKg: '5.972 × 10²⁴',
    gravityMs2: '9.81',
    surfaceAreaKm2: '5.10 × 10⁸',
  ),
  Planet(
    name: 'Mars',
    imagePath: AppAssets.marsImage,
    modelPath: AppAssets.marsModel,
    viewerZoom: 2.0,
    title: 'Mars: The Red Planet',
    about:
        "Mars, often called the Red Planet due to its reddish hue caused "
        "by iron oxide, is a cold, rocky world with a thin atmosphere. "
        "It has polar ice caps, ancient riverbeds, and evidence of past "
        "volcanic activity, suggesting that it once had a warmer and "
        "wetter climate. Mars is a prime target for exploration due to "
        "its potential for past or present microbial life, and NASA's "
        "Perseverance rover is currently searching for signs of ancient "
        "microbial life on the planet's surface.",
    distanceFromSunKm: '227,943,824',
    lengthOfDayHours: '24.62',
    orbitalPeriodYears: '1.88',
    radiusKm: '3,389.50',
    massKg: '6.39 × 10²³',
    gravityMs2: '3.71',
    surfaceAreaKm2: '1.45 × 10⁸',
  ),
  Planet(
    name: 'Jupiter',
    imagePath: AppAssets.jupiterImage,
    modelPath: AppAssets.jupiterModel,
    viewerZoom: 2.0,
    title: 'Jupiter: The Gas Giant',
    about:
        "Jupiter is the largest planet in our solar system, a gas giant "
        "composed primarily of hydrogen and helium. Its Great Red Spot, "
        "a massive storm that has been raging for centuries, is a "
        "testament to its turbulent atmosphere. Jupiter has a strong "
        "magnetic field and numerous moons, including Europa, which is "
        "believed to have a subsurface ocean that could potentially "
        "harbor life.",
    distanceFromSunKm: '778,547,669',
    lengthOfDayHours: '9.92',
    orbitalPeriodYears: '11.86',
    radiusKm: '69,911',
    massKg: '1.898 × 10²⁷',
    gravityMs2: '24.79',
    surfaceAreaKm2: '6.21 × 10¹⁰',
  ),
  Planet(
    name: 'Saturn',
    imagePath: AppAssets.saturnImage,
    modelPath: AppAssets.saturnModel,
    viewerZoom: 3.0,
    title: 'Saturn: The Ringed Planet',
    about:
        "Saturn is best known for its spectacular rings, which are "
        "composed of countless ice particles and rocks. It is a gas "
        "giant with a composition similar to Jupiter, but its rings and "
        "moons give it a distinct appearance. Saturn's largest moon, "
        "Titan, has a thick atmosphere and is the only known celestial "
        "body outside of Earth with liquid lakes and rivers.",
    distanceFromSunKm: '1,426,666,422',
    lengthOfDayHours: '10.66',
    orbitalPeriodYears: '29.46',
    radiusKm: '58,232',
    massKg: '5.683 × 10²⁶',
    gravityMs2: '10.44',
    surfaceAreaKm2: '4.27 × 10¹⁰',
  ),
  Planet(
    name: 'Uranus',
    imagePath: AppAssets.uranusImage,
    modelPath: AppAssets.uranusModel,
    viewerZoom: 2.6,
    title: 'Uranus: The Tilted Planet',
    about:
        "Uranus is an ice giant with a unique axial tilt, causing its "
        "seasons to be extreme. It is surrounded by faint rings and has "
        "numerous moons, including Miranda, known for its chaotic "
        "terrain. Uranus's atmosphere is composed primarily of hydrogen, "
        "helium, and methane, giving it a pale blue color.",
    distanceFromSunKm: '2,870,990,000',
    lengthOfDayHours: '17.24',
    orbitalPeriodYears: '84.01',
    radiusKm: '25,362',
    massKg: '8.681 × 10²⁵',
    gravityMs2: '8.69',
    surfaceAreaKm2: '8.1 × 10⁹',
  ),
  Planet(
    name: 'Neptune',
    imagePath: AppAssets.neptuneImage,
    modelPath: AppAssets.neptuneModel,
    viewerZoom: 2.0,
    title: 'Neptune: The Distant World',
    about:
        "Neptune is the farthest planet from the Sun and another ice "
        "giant. Its atmosphere is similar to Uranus, but it is a deeper "
        "blue color due to the presence of methane. Neptune has several "
        "moons, including Triton, which orbits the planet in the "
        "retrograde direction and is believed to be a captured Kuiper "
        "Belt object.",
    distanceFromSunKm: '4,498,252,900',
    lengthOfDayHours: '16.11',
    orbitalPeriodYears: '164.8',
    radiusKm: '24,622',
    massKg: '1.024 × 10²⁶',
    gravityMs2: '11.15',
    surfaceAreaKm2: '7.65 × 10⁹',
  ),
];

const int defaultPlanetIndex = 2;
