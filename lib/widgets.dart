import 'package:flutter/material.dart';


  Widget medicationTile(String name, String details) {
    return ListTile(
      leading: Icon(Icons.medication, color: Colors.blue),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(details),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
    );
  }

  Widget appointmentTile(String title, String details) {
    return ListTile(
      leading: Icon(Icons.calendar_today, color: Colors.blue),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(details),
    );
  }


