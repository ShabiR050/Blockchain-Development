let hospitals = [
  {
    id: 1,
    name: "Hospital A",
    location: "Delhi",
    noOfBeds: 450,
    availability: "Yes",
  },
  {
    id: 2,
    name: "Hospital B",

    location: "Pune",
    noOfBeds: 150,
    availability: "No",
  },
  {
    id: 3,
    name: "Hospital C",
    location: "Pune",
    noOfBeds: 350,
    availability: "Yes",
  },
];

//a) Number of Beds > 200
let bedsMoreThan200=hospitals.filter((item)=>item.noOfBeds>=200)
console.log(bedsMoreThan200)

//b) Availability of Beds = Yes
let availableBeds=hospitals.filter((item)=>item.availability==="Yes")
console.log(availableBeds)

//c) Location = Pune
let puneLocation=hospitals.filter((item)=>item.location==="Pune")
console.log(puneLocation)
