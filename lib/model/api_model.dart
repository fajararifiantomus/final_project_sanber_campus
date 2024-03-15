class ApiModel {
  String? make;
  String? model;
  String? year;
  String? type;
  String? displacement;
  String? engine;
  String? power;
  String? torque;
  String? compression;
  String? boreStroke;
  String? valvesPerCylinder;
  String? fuelSystem;
  String? fuelControl;
  String? ignition;
  String? lubrication;
  String? cooling;
  String? gearbox;
  String? transmission;
  String? clutch;
  String? frame;
  String? frontSuspension;
  String? frontWheelTravel;
  String? rearSuspension;
  String? rearWheelTravel;
  String? frontTire;
  String? rearTire;
  String? frontBrakes;
  String? rearBrakes;
  String? totalWeight;
  String? seatHeight;
  String? totalHeight;
  String? totalLength;
  String? totalWidth;
  String? groundClearance;
  String? wheelbase;
  String? fuelCapacity;
  String? starter;

  ApiModel({
    this.make,
    this.model,
    this.year,
    this.type,
    this.displacement,
    this.engine,
    this.power,
    this.torque,
    this.compression,
    this.boreStroke,
    this.valvesPerCylinder,
    this.fuelSystem,
    this.fuelControl,
    this.ignition,
    this.lubrication,
    this.cooling,
    this.gearbox,
    this.transmission,
    this.clutch,
    this.frame,
    this.frontSuspension,
    this.frontWheelTravel,
    this.rearSuspension,
    this.rearWheelTravel,
    this.frontTire,
    this.rearTire,
    this.frontBrakes,
    this.rearBrakes,
    this.totalWeight,
    this.seatHeight,
    this.totalHeight,
    this.totalLength,
    this.totalWidth,
    this.groundClearance,
    this.wheelbase,
    this.fuelCapacity,
    this.starter,
  });

  // Method untuk membuat objek ApiModel dari JSON
  ApiModel.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    year = json['year'];
    type = json['type'];
    displacement = json['displacement'];
    engine = json['engine'];
    power = json['power'];
    torque = json['torque'];
    compression = json['compression'];
    boreStroke = json['bore_stroke'];
    valvesPerCylinder = json['valves_per_cylinder'];
    fuelSystem = json['fuel_system'];
    fuelControl = json['fuel_control'];
    ignition = json['ignition'];
    lubrication = json['lubrication'];
    cooling = json['cooling'];
    gearbox = json['gearbox'];
    transmission = json['transmission'];
    clutch = json['clutch'];
    frame = json['frame'];
    frontSuspension = json['front_suspension'];
    frontWheelTravel = json['front_wheel_travel'];
    rearSuspension = json['rear_suspension'];
    rearWheelTravel = json['rear_wheel_travel'];
    frontTire = json['front_tire'];
    rearTire = json['rear_tire'];
    frontBrakes = json['front_brakes'];
    rearBrakes = json['rear_brakes'];
    totalWeight = json['total_weight'];
    seatHeight = json['seat_height'];
    totalHeight = json['total_height'];
    totalLength = json['total_length'];
    totalWidth = json['total_width'];
    groundClearance = json['ground_clearance'];
    wheelbase = json['wheelbase'];
    fuelCapacity = json['fuel_capacity'];
    starter = json['starter'];
  }
}