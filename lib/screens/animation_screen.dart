import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // Animation state toggle
  bool _isExpanded = false;

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic values based on animation state
    final double containerWidth = _isExpanded ? 270.0 : 140.0;
    final double containerHeight = _isExpanded ? 240.0 : 140.0;
    final Color containerColor = _isExpanded ? const Color(0xFFEA580C) : const Color(0xFF4F46E5);
    final double containerRadius = _isExpanded ? 50.0 : 20.0;
    final double containerElevation = _isExpanded ? 20.0 : 6.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7E22CE),
                      Color(0xFF9333EA),
                      Color(0xFFA855F7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9333EA).withValues(alpha: 0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.motion_photos_on_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Implicit Animations',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'AnimatedContainer automatically interpolates transitions between old and new values over 600ms with Curves.easeInOut.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.95),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Animated Container Playground
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: _toggleAnimation,
                    child: AnimatedContainer(
                      // Mandatory animation duration and easing curve
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,

                      // Animated properties
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _isExpanded
                              ? [
                                  const Color(0xFFEA580C),
                                  const Color(0xFFF97316),
                                  const Color(0xFFFB923C),
                                ]
                              : [
                                  const Color(0xFF4338CA),
                                  const Color(0xFF4F46E5),
                                  const Color(0xFF6366F1),
                                ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(containerRadius),
                        boxShadow: [
                          BoxShadow(
                            color: containerColor.withValues(alpha: 0.45),
                            blurRadius: containerElevation * 1.4,
                            spreadRadius: 2,
                            offset: Offset(0, containerElevation / 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _isExpanded
                                ? const Column(
                                    key: ValueKey('expanded_content'),
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.auto_awesome_rounded,
                                        color: Colors.white,
                                        size: 52,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Expanded State',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Size: 270 × 240\nBorder Radius: 50.0px',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Column(
                                    key: ValueKey('collapsed_content'),
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.touch_app_rounded,
                                        color: Colors.white,
                                        size: 38,
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Initial State',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Tap to Animate',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Animation Trigger Button
              SizedBox(
                width: 240,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _toggleAnimation,
                  icon: Icon(
                    _isExpanded ? Icons.restart_alt_rounded : Icons.play_arrow_rounded,
                    size: 22,
                  ),
                  label: Text(
                    _isExpanded ? 'Reset Animation' : 'Animate',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isExpanded ? const Color(0xFFEA580C) : const Color(0xFF4F46E5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    shadowColor: (_isExpanded ? const Color(0xFFEA580C) : const Color(0xFF4F46E5))
                        .withValues(alpha: 0.4),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Live Properties Inspector Panel
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9333EA).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.tune_rounded,
                            size: 16,
                            color: Color(0xFF9333EA),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Live Parameter Inspector',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24, color: Color(0xFFF1F5F9)),
                    _buildInspectorTile(
                      'Dimensions (W × H)',
                      '${containerWidth.toInt()}px × ${containerHeight.toInt()}px',
                      Icons.aspect_ratio_rounded,
                    ),
                    const SizedBox(height: 10),
                    _buildInspectorTile(
                      'Color Palette',
                      _isExpanded ? '#EA580C (Sunset Orange)' : '#4F46E5 (Indigo)',
                      Icons.palette_outlined,
                    ),
                    const SizedBox(height: 10),
                    _buildInspectorTile(
                      'Border Radius',
                      '${containerRadius.toInt()}px (${_isExpanded ? "Pill" : "Rounded Rect"})',
                      Icons.rounded_corner_rounded,
                    ),
                    const SizedBox(height: 10),
                    _buildInspectorTile(
                      'Interpolation',
                      '600ms (Curves.easeInOut)',
                      Icons.speed_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInspectorTile(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF94A3B8)),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
