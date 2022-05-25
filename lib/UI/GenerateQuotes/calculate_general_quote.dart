/**
 * Created by : Ayush Kumar
 * Created on : 23-05-2022
 */

enum Category {
  ALPHA,
  BETA,
  GAMMA,
}

enum Unit {
  MM,
  INCH,
}

class GeneralQuoteService {
  double mmToInch(double mm) {
    return mm / 25.4;
  }

  double inchSoot(int inch, int soot) {
    return inch + (1 / 8) * soot;
  }

  double calcQuantity(int quantity, int precision, Unit unit) {
    if (unit == Unit.MM) {
      return mmToInch(double.parse("$quantity.$precision"));
    } else {
      return inchSoot(quantity, precision);
    }
  }

  static const Map<int, String> designCodes = {
    730: "Single Panel Aplha",
    731: "Single Panle Beta",
    732: "Single Panel Gamma",
    830: "Double Panel Alpha",
    831: "Double Panel Beta",
    832: "Double Panel Gamma",
    930: "Double Panel Double Leaf Alpha",
    931: "Double Panel Double Leaf Beta",
    932: "Double Panel Double Leaf Gamma",
  };
  static const List<int> thicknesses = [32, 35];
  //heigth and height in inch
  //thickness in mm
  static int? calculate(
      int designCode, int thickness, double width, double height) {
    switch (designCode) {
      case 730:
        return calculateSinglePanel(Category.ALPHA, thickness, width, height);
      case 731:
        return calculateSinglePanel(Category.BETA, thickness, width, height);
      case 732:
        return calculateSinglePanel(Category.GAMMA, thickness, width, height);
      case 830:
        return calculateDoublePanel(Category.ALPHA, thickness, width, height);
      case 831:
        return calculateDoublePanel(Category.BETA, thickness, width, height);
      case 832:
        return calculateDoublePanel(Category.GAMMA, thickness, width, height);
      case 930:
        return calculateDoublePanelDoubleLeaf(
            Category.ALPHA, thickness, width, height);
      case 931:
        return calculateDoublePanelDoubleLeaf(
            Category.BETA, thickness, width, height);
      case 932:
        return calculateDoublePanelDoubleLeaf(
            Category.GAMMA, thickness, width, height);
      default:
        return null;
    }
    return null;
  }

  static int? calculateModule(
      int thickness, double width, double height, List<int> prices) {
    if (width <= 30) {
      return calculateForHeightModule(height, thickness, prices.sublist(0, 4));
    } else if (width <= 36) {
      return calculateForHeightModule(height, thickness, prices.sublist(4, 8));
    } else if (width <= 42) {
      return calculateForHeightModule(height, thickness, prices.sublist(8, 12));
    } else if (width <= 48) {
      return calculateForHeightModule(
          height, thickness, prices.sublist(12, 16));
    }
  }

  static int? calculateForHeightModule(
      double height, int thickness, List<int> prices) {
    if (height <= 84) {
      switch (thickness) {
        case 32:
          return prices[0];
        case 35:
          return prices[1];
        default:
          return null;
      }
    } else if (height <= 96) {
      switch (thickness) {
        case 32:
          return prices[2];
        case 35:
          return prices[3];
        default:
          return null;
      }
    }
    return null;
  }

  static int? calculateDoublePanel(
      Category category, int thickness, double width, double height) {
    List<List<int>> prices = [
      [
        4650,
        4850,
        5100,
        5300,
        4950,
        5150,
        5400,
        5600,
        5300,
        5500,
        5750,
        5950,
        5700,
        5900,
        6200,
        6400
      ],
      [
        4850,
        5050,
        5300,
        5500,
        5150,
        5350,
        5600,
        5800,
        5500,
        5700,
        5950,
        6150,
        5900,
        6100,
        6400,
        6600
      ],
      [
        5250,
        5450,
        5700,
        5900,
        5550,
        5750,
        6000,
        6200,
        5950,
        6150,
        6400,
        6600,
        6350,
        6550,
        6850,
        7050
      ]
    ];
    if (category == Category.ALPHA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[0],
      );
    } else if (category == Category.BETA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[1],
      );
    } else if (category == Category.GAMMA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[2],
      );
    }
    return null;
  }

  static int? calculateSinglePanel(
      Category category, int thickness, double width, double height) {
    List<List<int>> prices = [
      [
        4350,
        4550,
        4800,
        5000,
        4650,
        4850,
        5100,
        5300,
        5000,
        5200,
        5450,
        5650,
        5400,
        5600,
        5850,
        6050
      ],
      [
        4550,
        4750,
        5000,
        5200,
        4850,
        5050,
        5300,
        5500,
        5200,
        5400,
        5650,
        5850,
        5600,
        5800,
        6050,
        6250
      ],
      [
        4950,
        5150,
        5400,
        5600,
        5250,
        5450,
        5700,
        5900,
        5650,
        5850,
        6300,
        6500,
        6050,
        6250,
        6500,
        6700
      ]
    ];
    if (category == Category.ALPHA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[0],
      );
    } else if (category == Category.BETA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[1],
      );
    } else if (category == Category.GAMMA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[2],
      );
    }
    return null;
  }

  static int? calculateDoublePanelDoubleLeaf(
      Category category, int thickness, double width, double height) {
    List<List<int>> prices = [
      [
        6050,
        6250,
        6500,
        6700,
        6350,
        6550,
        6800,
        7000,
        6700,
        6900,
        7150,
        7350,
        7100,
        7300,
        7600,
        7800
      ],
      [
        6250,
        6450,
        6700,
        6900,
        6550,
        6750,
        7000,
        7200,
        6900,
        7100,
        7350,
        7550,
        7300,
        7500,
        7800,
        8000
      ],
      [
        7250,
        7450,
        7700,
        7900,
        7550,
        7750,
        8000,
        8200,
        7900,
        8100,
        8350,
        8550,
        8300,
        8500,
        8800,
        9000
      ]
    ];
    if (category == Category.ALPHA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[0],
      );
    } else if (category == Category.BETA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[1],
      );
    } else if (category == Category.GAMMA) {
      return calculateModule(
        thickness,
        width,
        height,
        prices[2],
      );
    }
    return null;
  }
}
