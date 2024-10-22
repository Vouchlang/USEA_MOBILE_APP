// User Domain
const String APIUrlUserKh_ = 'http://116.212.155.149:9999/api/apidata.php?';
const String APIUrlUserEn_ = 'http://116.212.155.149:9999/api/apidata_en.php?';

// Student Khmer Data
const String APIStLoginKh = APIUrlUserKh_ + 'action=login_student';
const String APIStScheduleKh = APIUrlUserKh_ + 'action=study_schedule';
const String APIStCredit = APIUrlUserKh_ + 'action=study_credit';
const String APIStFeedback = APIUrlUserKh_ + 'action=feedback';
const String APIStPerformanceKh = APIUrlUserKh_ + 'action=study_performance';
const String APIStAttendance = APIUrlUserKh_ + 'action=attendance_data';
const String APIStPayment = APIUrlUserKh_ + 'action=payment';
const String APIStOtherPayment = APIUrlUserKh_ + 'action=other_payment';
const String APIStExamKh = APIUrlUserKh_ + 'action=exam_schedule';
const String APIStAssignmentKh = APIUrlUserKh_ + 'action=moodle_activities';

// Student English Data
const String APIStLoginEn = APIUrlUserEn_ + 'action=login_student';
const String APIStScheduleEn = APIUrlUserEn_ + 'action=study_schedule';
const String APIStPerformanceEn = APIUrlUserEn_ + 'action=study_performance';
const String APIStExamEn = APIUrlUserEn_ + 'action=exam_schedule';
const String APIStAssignmentEn = APIUrlUserEn_ + 'action=moodle_activities';

// Guardian Data
const String APIGuardianLogin = APIUrlUserKh_ + 'action=login_parents';
