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
        Schema::create('contract_vouchers', function (Blueprint $table) {
            $table->id();
            $table->date('date');
            $table->string('voucher_number')->nullable();

            $table->unsignedBigInteger('expense_coa_dr_id');
            $table->unsignedBigInteger('coa_payable_cr_id');

            
            $table->decimal('unloading_rate', 10, 2)->nullable();
            $table->decimal('unloading_bags', 10, 2)->nullable();

            $table->decimal('loading_rate', 10, 2)->nullable();
            $table->decimal('loading_bags', 10, 2)->nullable();

            $table->decimal('bag_cutting_rate', 10, 2)->nullable();
            $table->decimal('bag_cutting_bags', 10, 2)->nullable();

            $table->decimal('wanda_production_rate', 10, 2)->nullable();
            $table->decimal('wanda_production_bags', 10, 2)->nullable();

            $table->decimal('unload_refill_rate', 10, 2)->nullable();
            $table->decimal('unload_refill_bags', 10, 2)->nullable();

            $table->decimal('packing_rate', 10, 2)->nullable();
            $table->decimal('packing_bags', 10, 2)->nullable();

            $table->decimal('shifting_rate', 10, 2)->nullable();
            $table->decimal('shifting_bags', 10, 2)->nullable();


            $table->decimal('total_bags', 10, 2)->nullable();
            $table->decimal('total_amount', 10, 2)->nullable();

            $table->unsignedBigInteger('created_by')->nullable();// ID of the user who created the record
            $table->unsignedBigInteger('updated_by')->nullable();// ID of the user who last updated the record


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
        Schema::dropIfExists('contract_vouchers');
    }
};
