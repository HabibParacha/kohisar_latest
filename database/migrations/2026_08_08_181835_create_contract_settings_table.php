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
        Schema::create('contract_settings', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('coa_expense_dr_id');
            $table->unsignedBigInteger('coa_payable_cr_id');
            $table->decimal('unloading',15,2)->default(0);
            $table->decimal('loading',15,2)->default(0);
            $table->decimal('bag_cutting',15,2)->default(0);
            $table->decimal('wanda_production',15,2)->default(0);
            $table->decimal('unload_refill',15,2)->default(0);
            $table->decimal('packing',15,2)->default(0);
            $table->decimal('shifting',15,2)->default(0);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contract_settings');
    }
};
