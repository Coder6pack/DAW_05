<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('footers', function (Blueprint $table) {
            $table->id(); // BIGINT(20) PRIMARY KEY
            $table->text('address')->nullable(); // Address
            $table->text('description')->nullable(); // Description
            $table->text('social_link')->nullable(); // Social Link
            $table->text('contact')->nullable(); // Contact
            $table->timestamps(); // Create_at & Update_at (Datetime)
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('footers');
    }
};
