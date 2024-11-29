<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class Footers extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('footers')->insert([
            [
                'address' => 'Quận 1, Thành phố Hồ Chí Minh',
                'description' => 'Website Nhóm 5 là một công ty chuyên kinh doanh điện thoại di động. Chúng tôi luôn cam kết mang đến cho khách hàng những sản phẩm chất lượng tốt nhất cùng dịch vụ hỗ trợ tận tình.',
                'social_link' => json_encode([
                    'facebook' => 'https://facebook.com/nhom5',
                    'twitter' => 'https://twitter.com/nhom5',
                    'instagram' => 'https://instagram.com/nhom5',
                ]),
                'contact' => json_encode([
                    'email' => 'support@nhom5.com',
                    'phone' => '0901234567',
                ]),
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'address' => 'Quận 1, Thành phố Hồ Chí Minh',
                'description' => 'Chính sách bảo hành: Cam kết bảo hành sản phẩm trong vòng 12 tháng. Chính sách đổi trả: Đổi trả trong vòng 7 ngày nếu sản phẩm bị lỗi kỹ thuật.',
                'social_link' => json_encode([
                    'youtube' => 'https://youtube.com/nhom5',
                    'linkedin' => 'https://linkedin.com/company/nhom5',
                ]),
                'contact' => json_encode([
                    'email' => 'policy@nhom5.com',
                    'phone' => '0907654321',
                ]),
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
