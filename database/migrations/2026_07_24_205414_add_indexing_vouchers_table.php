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
        Schema::table('vouchers', function (Blueprint $table) {
            $table->index(['code', 'date', 'id']);
            $table->index(['date', 'id']);
            $table->index(['code', 'id']);
            $table->index('chart_of_account_id');
            $table->index('invoice_master_id');
            $table->index('created_by');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vouchers', function (Blueprint $table) {
            $table->dropIndex(['code', 'date', 'id']);
            $table->dropIndex(['date', 'id']);
            $table->dropIndex(['code', 'id']);
            $table->dropIndex(['chart_of_account_id']);
            $table->dropIndex(['invoice_master_id']);
            $table->dropIndex(['created_by']);
        });
    }
};
