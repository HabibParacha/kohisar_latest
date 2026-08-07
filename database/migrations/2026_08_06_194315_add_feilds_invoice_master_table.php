<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('invoice_master', function (Blueprint $table) {
            $table->string('contact_person', 100)->nullable();
            $table->string('contact_person_phone', 100)->nullable();
            $table->text('custom_notes')->nullable();
            $table->unsignedBigInteger('sale_order_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('invoice_master', function (Blueprint $table) {
            $table->dropColumn('contact_person');
            $table->dropColumn('contact_person_phone');
            $table->dropColumn('custom_notes');
            $table->dropColumn('sale_order_id');
        });
    }
};
