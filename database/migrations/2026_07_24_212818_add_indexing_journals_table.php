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
        Schema::table('journals', function (Blueprint $table) {
            $table->index(['chart_of_account_id', 'date']);
            $table->index(['customer_id', 'chart_of_account_id', 'date']);
            $table->index(['supplier_id', 'chart_of_account_id', 'date']);
            $table->index('date');
            $table->index('voucher_id');
            $table->index('party_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('journals', function (Blueprint $table) {
            $table->dropIndex(['chart_of_account_id', 'date']);
            $table->dropIndex(['customer_id', 'chart_of_account_id', 'date']);
            $table->dropIndex(['supplier_id', 'chart_of_account_id', 'date']);
            $table->dropIndex('date');
            $table->dropIndex('voucher_id');
            $table->dropIndex('party_id');
        });
    }
};
