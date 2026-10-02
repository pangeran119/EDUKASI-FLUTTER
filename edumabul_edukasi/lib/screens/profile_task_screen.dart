import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../models/user_model.dart';
import '../theme/app_theme.dart';
import '../widgets/brand_widgets.dart';
import '../widgets/task_card.dart';
import 'login_screen.dart';

class ProfileTaskScreen extends StatefulWidget {
  @override
  _ProfileTaskScreenState createState() => _ProfileTaskScreenState();
}

class _ProfileTaskScreenState extends State<ProfileTaskScreen> {
  final UserModel user = UserModel(
    name: 'ADITYA BIMA',
    email: 'bima1310@gmail.com',
    school: 'Smk Negeri 1 - Kelas XI RPL 1',
    status: 'Siswa Aktif',
    badge: 'Duta Anti - Bullying',
  );

  int _selectedFilter = 0; // 0: Semua, 1: Belum, 2: Selesai

  List<TaskModel> tasks = [
    TaskModel(
      id: '1',
      title: 'Kenali jenis jenis bullying',
      category: 'Bimbingan Konseling',
      isCompleted: true,
    ),
    TaskModel(
      id: '2',
      title: 'Refleksi menyikapi Bullying',
      category: 'PPKn',
      isCompleted: false,
    ),
    TaskModel(
      id: '3',
      title: 'Poster kampanye Stop Bullying',
      category: 'Seni Budaya',
      isCompleted: false,
    ),
    TaskModel(
      id: '4',
      title: 'Diskusi Empati di Media Sosial',
      category: 'Bimbingan Konseling',
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<TaskModel> filteredTasks = tasks.where((t) {
      if (_selectedFilter == 1) return !t.isCompleted;
      if (_selectedFilter == 2) return t.isCompleted;
      return true;
    }).toList();

    int completedCount = tasks.where((t) => t.isCompleted).length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: EdumabulLogo(size: 30, textColor: AppColors.primaryDark),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: AppColors.primaryDark),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: AppColors.primaryYellow,
                        child: Text(
                          'AB',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    user.email,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    user.school,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildChip(
                        user.status,
                        AppColors.primaryYellow,
                        AppColors.primaryDark,
                      ),
                      SizedBox(width: 8),
                      _buildChip(user.badge, Colors.white24, Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Header Tugas Edukasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tugas Edukasi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                Text(
                  '$completedCount dari ${tasks.length} selesai',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Filter Buttons
            Row(
              children: [
                _buildFilterButton('Semua (${tasks.length})', 0),
                SizedBox(width: 8),
                _buildFilterButton(
                  'Belum (${tasks.length - completedCount})',
                  1,
                ),
                SizedBox(width: 8),
                _buildFilterButton('Selesai ($completedCount)', 2),
              ],
            ),
            SizedBox(height: 16),

            // Task List Cards
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return TaskCard(
                  task: task,
                  onChanged: (val) {
                    setState(() {
                      int originalIndex = tasks.indexWhere(
                        (t) => t.id == task.id,
                      );
                      tasks[originalIndex] = TaskModel(
                        id: task.id,
                        title: task.title,
                        category: task.category,
                        isCompleted: val ?? false,
                      );
                    });
                  },
                );
              },
            ),
            SizedBox(height: 16),

            // Logout Button
            SizedBox(
              width: double.infinity,
              height: 45,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout, color: Colors.redAccent, size: 18),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red.shade200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color bg, Color text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: text,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, int index) {
    bool isSelected = _selectedFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDark : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryDark : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
