import 'package:flutter/material.dart';
import 'package:eldercare/widgets/widgets.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final srcWidth = MediaQuery.of(context).size.width;
    final srcHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: srcHeight * 0.05),

              // Welcome Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back, kk",
                        style: TextStyle(
                          fontSize: srcWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "Caregiver",
                        style: TextStyle(fontSize: srcWidth * 0.035, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  // CircleAvatar(
                  //   radius: srcWidth * 0.07,
                  //   backgroundImage: AssetImage('assets/user_avatar.png'), // Replace with your image
                  // ),
                  Icon(Icons.notifications,
                  size: srcWidth*0.08,),
                ],

              ),
              SizedBox(height: 16.0),

              // Emergency SOS Button
              Center(
                child: SizedBox(
                  width: srcWidth * 0.9,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.warning_amber_outlined, color: Colors.white),
                    label: Text(
                      "Emergency SOS",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Health Overview Section
              Text(
                "Health Overview",
                style: TextStyle(
                  fontSize: srcWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _healthContainer(srcWidth, "Heart Rate", "75 BPM", Icons.favorite, Colors.red),
                  _healthContainer(srcWidth, "Blood Pressure", "120/80", Icons.water, Colors.blue),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _healthContainer(srcWidth, "Blood Sugar", "95 mg/dL", Icons.bloodtype, Colors.orange),
                  _healthContainer(srcWidth, "Steps", "2,450", Icons.directions_walk, Colors.green),
                ],
              ),
              const SizedBox(height: 16.0),

              // Today's Medications Section
              Text(
                "Today's Medications",
                style: TextStyle(
                  fontSize: srcWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: Column(
                  children: [
                    medicationTile("Lisinopril", "10mg - 8:00 AM"),
                    Divider(height: 1.0),
                    medicationTile("Metformin", "500mg - 2:00 PM"),
                    Divider(height: 1.0),
                    medicationTile("Simvastatin", "20mg - 8:00 PM"),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Current Location Section
              Text(
                "Current Location",
                style: TextStyle(
                  fontSize: srcWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: Column(
                  children: [
                    Container(
                      height: srcHeight * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                        color: Colors.grey[300], // Placeholder for the map
                      ),
                      child: Center(
                        child: Text(
                          "Map Placeholder",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text("Last updated: 2 mins ago"),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("Track Now"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Upcoming Appointments Section
              Text(
                "Upcoming Appointments",
                style: TextStyle(
                  fontSize: srcWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: Column(
                  children: [
                    appointmentTile("Dr. Smith - Cardiology", "Today, 2:30 PM - Medical Center"),
                    Divider(height: 1.0),
                    appointmentTile("Physical Therapy", "Tomorrow, 10:00 AM - Wellness Center"),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _healthContainer(double srcWidth, String title, String value, IconData icon, Color iconColor) {
    return Container(
      width: (srcWidth - 48) / 2, // Adjust width for 2 items in a row
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 30.0, color: iconColor),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }


}
