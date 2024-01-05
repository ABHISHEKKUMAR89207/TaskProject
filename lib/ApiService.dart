import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CarrouselProvider with ChangeNotifier {
  final String baseurl;

  CarrouselProvider(this.baseurl);
//default images if
  List<String> _carrouselImages = [
    "https://thumbs.dreamstime.com/b/dramatic-stormy-sky-dark-clouds-rain-dramatic-stormy-sky-dark-clouds-rain-weather-climate-meteorology-background-106270295.jpg",
    "https://thumbs.dreamstime.com/b/dark-ocean-storm-lgihting-waves-night-77316274.jpg",
    "https://thumbs.dreamstime.com/b/horror-landscape-dark-forest-scary-tree-113159188.jpg",
    "https://st2.depositphotos.com/4753237/7226/i/450/depositphotos_72269885-stock-photo-return-into-kobane.jpg",
  ];
  List<Map<String, String>> _breathworkImages = [
    {
      "title": "Guided Breathwork Session: Calm Your Mind",
      "url":
          "https://thumbs.dreamstime.com/b/behind-scenes-video-production-video-shooting-behind-scenes-video-production-video-shooting-studio-location-118511999.jpg",
      "timing": "00:00"
    },
    {
      "title": "Soothing Breathwork Music with Baby Gorilla",
      "url": "https://thumbs.dreamstime.com/b/mother-baby-gorilla-19999554.jpg",
      "timing": "01:30"
    },
    {
      "title": "Journey to Inner Peace: Visual Breathwork",
      "url":
          "https://st2.depositphotos.com/4753237/7226/i/450/depositphotos_72269885-stock-photo-return-into-kobane.jpg",
      "timing": "03:00"
    },
    {
      "title": "Energizing Breathwork Workout in the Gym",
      "url":
          "https://thumbs.dreamstime.com/b/man-weight-training-equipment-sport-gym-22843139.jpg",
      "timing": "04:30"
    },
  ];
  List<Map<String, String>> _breathTrendingworkImages = [
    {
      "title": "Guided Breathwork Session: Calm Your Mind",
      "url":
          "https://thumbs.dreamstime.com/b/behind-scenes-video-production-video-shooting-behind-scenes-video-production-video-shooting-studio-location-118511999.jpg",
      "timing": "00:00"
    },
    {
      "title": "Soothing Breathwork Music with Baby Gorilla",
      "url": "https://thumbs.dreamstime.com/b/mother-baby-gorilla-19999554.jpg",
      "timing": "01:30"
    },
    {
      "title": "Journey to Inner Peace: Visual Breathwork",
      "url":
          "https://st2.depositphotos.com/4753237/7226/i/450/depositphotos_72269885-stock-photo-return-into-kobane.jpg",
      "timing": "03:00"
    },
    {
      "title": "Energizing Breathwork Workout in the Gym",
      "url":
          "https://thumbs.dreamstime.com/b/man-weight-training-equipment-sport-gym-22843139.jpg",
      "timing": "04:30"
    },
  ];
  List<String> get carrouselImages => _carrouselImages;
  List<Map<String, String>> get breathworkImages => _breathworkImages;
  List<Map<String, String>> get breathTrendingworkImages =>
      _breathTrendingworkImages;

  Future<void> fetchCarrouselImages() async {
    return;
    try {
      final response = await http.get(Uri.parse("$baseurl/enpoint"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _carrouselImages = List<String>.from(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load carrousel images');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> fetchTrendingBreathworkImages() async {
    return;
    try {
      final response = await http.get(Uri.parse('$baseurl/end point'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _breathworkImages = List<Map<String, String>>.from(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load breathwork images');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> fetchBreathworkImages() async {
    await Future.delayed(Duration(seconds: 2)); // Introduce a 2-second delay

    return;
    try {
      final response = await http.get(Uri.parse('$baseurl/end point'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _breathworkImages = List<Map<String, String>>.from(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load breathwork images');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
