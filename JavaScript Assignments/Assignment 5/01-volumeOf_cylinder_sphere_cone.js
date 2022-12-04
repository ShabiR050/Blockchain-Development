class VolumeCalculator {
//   constructor(height, radius) {
//     this.height = height;
//     this.radius = radius;
//   }

  cylinderVolume(radius, height) {
    const area = Math.PI * radius ** 2;
    return (area * height).toFixed(4);
  }

  sphereVolume(radius) {
    return ((4 * Math.PI * radius ** 3) / 3).toFixed(4);
  }

  coneVolume(radius, height) {
    return (Math.PI * radius ** 2 * (height / 3)).toFixed(4);
  }
}

let volume = new VolumeCalculator();
console.log("Volume of cylinder is :-", volume.cylinderVolume(7, 2));
console.log("Volume of Sphere is :-", volume.sphereVolume(7));
console.log("Volume of Cone is :-", volume.coneVolume(7, 2));
