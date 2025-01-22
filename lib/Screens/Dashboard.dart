import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, String>> medications = [
    {"name": "Lisinopril", "time": "8:00 AM - 10mg"},
    {"name": "Metformin", "time": "2:00 PM - 500mg"},
    {"name": "Simvastatin", "time": "8:00 PM - 20mg"},
  ];

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(
                          fontSize: srcWidth * 0.035,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.notifications, size: srcWidth * 0.08),
                ],
              ),
              SizedBox(height: 16.0),

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
                  children: medications.map((medication) {
                    return _medicationTile(
                      context,
                      medication["name"]!,
                      medication["time"]!,
                    );
                  }).toList(),
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

  Widget _medicationTile(BuildContext context, String name, String time) {
    return GestureDetector(
      onTap: () {
        // Pass the selected medication to EditMedicationScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditMedicationScreen(name: name, time: time),
          ),
        ).then((updatedMedication) {
          if (updatedMedication != null) {
            setState(() {
              // Update the medication in the list after editing
              for (int i = 0; i < medications.length; i++) {
                if (medications[i]["name"] == updatedMedication["name"]) {
                  medications[i] = updatedMedication; // Update specific medication
                  break; // Exit the loop once found
                }
              }
            });
          }
        });
      },
      child: ListTile(
        title: Text(name),
        subtitle: Text(time),
        trailing: Icon(Icons.edit, color: Colors.blue),
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

  // Dummy Appointment Tile
  Widget appointmentTile(String title, String details) {
    return ListTile(
      title: Text(title),
      subtitle: Text(details),
    );
  }

  // Drawer for Notifications
  void _openNotificationDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: List.generate(10, (index) {
            return ListTile(
              title: Text("Notification ${index + 1}"),
              subtitle: Text("This is a dummy notification."),
            );
          }),
        );
      },
    );
  }
}

// Dummy EditMedicationScreen
class EditMedicationScreen extends StatelessWidget {
  final String name;
  final String time;

  EditMedicationScreen({required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Medication")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Edit the medication details for $name"),
            TextField(
              decoration: InputDecoration(labelText: "Medication Name"),
              controller: TextEditingController(text: name),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Medication Time"),
              controller: TextEditingController(text: time),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save the edited medication
                Navigator.pop(context, {"name": name, "time": time});
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
